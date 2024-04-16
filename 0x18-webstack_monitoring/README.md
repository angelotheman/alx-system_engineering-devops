## Description
Creating a Data-dog application agent for my webserver

## Concepts
- Datadog
- Web Monitoring

## To get the dashboard id, do these
```
export DD_API_KEY="Your api key"
export DD_APP_KEY="Your application key"

curl -X GET "https://api.datadoghq.com/api/v1/dashboard" \
     -H "Accept: application/json" \
     -H "DD-API-KEY: ${DD_API_KEY}" \
     -H "DD-APPLICATION-KEY: ${DD_APP_KEY}"
```

### Happy Coding 🚀
