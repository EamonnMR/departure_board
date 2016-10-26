# Build:
``` 
  $ npm install # Install the bundle.json
  $ npm start # Run locally - you'll want a local version of
              # the csv saved in /public/api
```
# Deploy:

Make sure you set up ops/inventory with the servers you want to deploy to, then run

```
  $ npm run build  # Create release build of project
  
  $ cd ops; ansible-playbook deploy.yaml -i inventory # Deploy
```              
