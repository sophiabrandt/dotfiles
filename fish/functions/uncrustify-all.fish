function uncrustify-all
find . \( -name "*.cpp" -o -name "*.c" -o -name "*.h" \) -exec uncrustify -c ~/uncrustify.cfg --no-backup {} +
end
