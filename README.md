# Limer Docker

Create a LimeSurvey application (based on [`crramirez/limesurvey`](https://hub.docker.com/r/crramirez/limesurvey/)) with these options preconfigured and installed:

- User name: limer
- Password: limerpassword
- RPC API: enabled

**NB: This is totally not a secure installation at all and is really only meant for testing [limer](https://github.com/cloudyr/limer) locally and on Travis-CI.**

## Usage

To create a preconfigured LimeSurvey application on port 12345, run:

    docker pull andrewheiss/limer-docker:latest
    docker run -d --name limer -p 12345:80 andrewheiss/limer-docker:latest
    docker exec -it limer ./install.sh

The API will be accessible at [http://localhost:12345/index.php?r=admin/remotecontrol](http://localhost:12345/index.php?r=admin/remotecontrol), and the administration dashboard is accessible at [http://localhost:12345/index.php?r=admin](http://localhost:12345/index.php?r=admin).


## Note

Simply adding `CMD ["/install.sh]` to the Dockerfile doesn't work because of how the original [`crramirez/limesurvey` image](https://hub.docker.com/r/crramirez/limesurvey/) (and Docker in general) works—it creates a background process and doesn't(?) allow additional `CMD` statements to come later (or, at least, they don't work right; [more details](http://stackoverflow.com/a/27708039/120898))

Rather than fork `crramirez/limesurvey`, modify all the start/installation scripts there, and keep the fork up to date, it's easier to inject my own installation script and then run it after starting the container using `docker exec`.
