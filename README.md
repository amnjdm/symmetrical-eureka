# symmetrical-eureka

_Peep the Wiki page for a more detailed explanation of how I got this to work_

You can definitely rename these images and containers to whatever you’d like…

I made two directories: _dataimage_ & _nice_

In _dataimage_, I placed my dotfiles (bashrc, gitconfig, tmux.conf & vimrc) and the Dockerfile for that image. This Dockerfile is built an image and a container is created with that image to act as the home directory in the other usable container (created from _nice_) and to persist data.

After all of the files are created in the corresponding directories, while in the _dataimage_ directory, run:

    docker build -t dataimage .

That will create the image needed to create the container:

    docker create -v /home/dev --name homecontainer dataimage

Then change to the nice directory:

    docker build -t nice .

At this point if you run:

    docker images

The results will likely show 3 images (ubuntu, nice and dataimage).

At this point, run this from anywhere:

    docker run -it --volumes-from homecontainer nice

Maybe you'll end up seeing something like this:

![Nice!](https://github.com/amnjdm/symmetrical-eureka/blob/master/img/screenshot_docker_container.jpg)
