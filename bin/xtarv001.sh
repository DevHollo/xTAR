#!/bin/bash

# --- Config ---
thisversion="v0.0.1"
version_url="https://raw.githubusercontent.com/DevHollo/xTAR/refs/heads/main/VERSION"
spacer="+=---------------------------=+"

# --- Functions ---
check_version() {
    newestversion=$(curl -fsSL "$version_url")
    if [[ "$thisversion" != "$newestversion" ]]; then
        echo -e "🧨 xTAR $thisversion is outdated! Latest is $newestversion."
        echo -e "Run with --update to fetch the latest version."
    fi
}

usage() {
    echo "xTAR $thisversion - A fancy archive tool by DevHollo on Github"
    echo
    echo "Usage: xtar [option]"
    echo
    echo "Options:"
    echo "  --help, -h       Show this help message"
    echo "  --update         Update to the latest version [W.I.P.]"
    echo "  extract, -e      Extract archive"
    echo "  create, -c       Create new archive"
    echo
}

handle_args() {
    case "$1" in
        --help | help | -h)
            usage
            ;;

        --update)
            echo "This is coming soon"
            ;;

        extract | -e)
            archive="$2"
            if [[ -z "$archive" ]]; then
                echo "❌ Please provide an archive file to extract."
                echo "Usage: xtar extract myfile.tar.gz"
                exit 1
            fi

            if [[ ! -f "$archive" ]]; then
                echo "❌ File not found: $archive"
                exit 1
            fi

            echo "🔍 Inspecting '$archive' contents..."

            case "$archive" in
                *.tar.gz | *.tgz)
                    filelist=$(tar -tzf "$archive")
                    decompress="tar -xzf"
                    ;;
                *.tar.xz | *.txz)
                    filelist=$(tar -tJf "$archive")
                    decompress="tar -xJf"
                    ;;
                *.tar.bz2 | *.tbz2)
                    filelist=$(tar -tjf "$archive")
                    decompress="tar -xjf"
                    ;;
                *.tar)
                    filelist=$(tar -tf "$archive")
                    decompress="tar -xf"
                    ;;
                *)
                    echo "❌ Unsupported archive format: $archive"
                    exit 1
                    ;;
            esac

            toplevels=$(echo "$filelist" | cut -d/ -f1 | sort -u)
            if [[ $(echo "$toplevels" | wc -l) -eq 1 ]]; then
                echo "📁 Archive already contains a folder ('$toplevels'), extracting here..."
                eval $decompress "\"$archive\""
                echo "✅ Extracted into ./$toplevels"
            else
                folder="${archive##*/}"
                folder="${folder%.*}"
                folder="${folder%.*}"
                mkdir -p "$folder"
                echo "📁 Archive has no top folder, extracting into ./$folder"
                eval $decompress "\"$archive\"" -C "\"$folder\""
                echo "✅ Extraction complete in ./$folder"
            fi
            ;;

        create | -c)
            outname="$2"
            shift 2

            if [[ -z "$outname" || $# -lt 1 ]]; then
                echo "❌ Usage: xtar create <output.tar.gz> <files...>"
                exit 1
            fi

            echo "📦 Creating archive: $outname"

            case "$outname" in
                *.tar.gz | *.tgz)
                    tar -czf "$outname" "$@"
                    ;;
                *.tar.xz | *.txz)
                    tar -cJf "$outname" "$@"
                    ;;
                *.tar.bz2 | *.tbz2)
                    tar -cjf "$outname" "$@"
                    ;;
                *.tar)
                    tar -cf "$outname" "$@"
                    ;;
                *)
                    echo "❌ Unsupported output format: $outname"
                    echo "Supported: .tar .tar.gz .tar.xz .tar.bz2"
                    exit 1
                    ;;
            esac

            echo "✅ Archive created: $outname"
            ;;

        *)
            echo "❓ Unknown command: $1"
            usage
            exit 1
            ;;
    esac
}

# --- Main Execution ---
check_version

if [[ $# -eq 0 ]]; then
    usage
    exit 0
else
    handle_args "$@"
fi