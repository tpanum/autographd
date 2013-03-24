var Handlebars = require('handlebars');

var fs = require('fs');
var rawTemplate;
var templatePath = process.argv[2];
var fileName = templatePath.replace(/^.*[\\\/]/, '').split('.')[0];


rawTemplate = fs.readFileSync(templatePath, 'utf8');

var compiledTemplate = Handlebars.compile(rawTemplate);

var html = compiledTemplate(JSON.parse(process.argv[3]));


fs.writeFile("./signatures/"+fileName+".html", html, function(err) {
    if(err) {
        console.log(err);
    } else {
        
    }
});