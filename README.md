# MIUI 8 for Samsung S4 Active
<p align="center"> 
<img src="https://github.com/ivancristina/ivancristina.github.io/raw/master/img/in-post/post-js-version/Miui.png">
</p>

Getting Android SDK
---------------

In order to build patchrom project, you must have android sdk installed.(http://developer.android.com/sdk/installing.html)

And add the sdk tools and platform-tools to PATH.
Open Terminal, digite this:

gedit ~/.bashrc

add this line in top:

export PATH=${PATH}:/home/xxx/android-sdk-linux/tools
export PATH=${PATH}:/home/xxx/android-sdk-linux/platform-tools

Getting Started
---------------

To get started with MiCode/patchrom, you'll need to get familiar with Git and Repo.
To get started with MiCode/patchrom, you'll need to get
familiar with [Git and Repo](https://source.android.com/source/using-repo.html).

To initialize your local repository using the patchrom trees, use a command like this:

To initialize your local repository using the patchrom trees, use a command like this:

$ mkdir patchrom

$ cd patchrom

$ repo init -u git://github.com/MiCode/patchrom.git -b marshmallow

Then to sync up:

$ repo sync

$ git clone git@github.com:JactiveLTEam/MIUI-8.git jactivelte

Build
--------

$ . build/envsetup.sh && cd jactivelte

$ make fullota
