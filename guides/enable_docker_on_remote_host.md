### How to enable docker remote API on docker host?
1. Navigate to /lib/systemd/system in your terminal and open the `docker.service` file.  
`nano /lib/systemd/system/docker.service`
2. Find the line which starts with `ExecStart` and add `-H=tcp://0.0.0.0:2375` to make it look like:  
`ExecStart=/usr/bin/dockerd -H=fd:// -H=tcp://0.0.0.0:2375`
3. Save the Modified File
4. Reload the docker daemon:  
`systemctl daemon-reload`
5. Restart the container:
`sudo service docker restart`
6. Test if it is working by using this command, if everything is fine below command should return a JSON:  
`curl http://localhost:2375/images/json`

To test remotely, use the PC name or IP address of Docker Host