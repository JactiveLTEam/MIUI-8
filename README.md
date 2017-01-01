# MIUI 8 for Samsung S4 Active
===========

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

$ git clone https://github.com/DiorgenesS/MIUI_S4_Active.git S4active

Build
--------

$ . build/envsetup.sh && cd S4active

$ make fullota