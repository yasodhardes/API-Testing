var fs = require('fs'),
    newman = require('newman'),
    results = [];
    
newman.run({
        reporters: 'cli',
        collection: './doc/api-testing.postman_collection.json',
        environment: 'doc/local.postman_environment.json'
}).on('request', function(err, args) {
        if(!err) {
                var rawBody = args.response.stream,
                 body = rawBody.toString();

                results.push(JSON.parse(body));
        }
}).on('done', function(err, summary) {
        fs.writeFileSync('test-results-report.json', JSON.stringify(results, null, 4));
});