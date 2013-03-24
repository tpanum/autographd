JSON=$(cat my_autographd.json)
mkdir -p signatures
for template in templates/*.handlebars ; do node src/engine.js "./$template" "$JSON"; done