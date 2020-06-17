# speed-snail

Speed Snail is an interactive command line program post install Ubuntu 18.04 and 20.04 (desktop and server)

# How to use 

Be careful the use of the script can make your system unstable, it is not always finished in development

```bash
wget -O - https://gitlab.com/jc.henry/speed-snail/-/raw/master/speed-snail.sh?inline=false | sudo bash
```

if you need insert CD at step Auto update driver, edit your app list :

```bash
sudo nano /etc/apt/sources.list
Add # before dev cdrom
# deb cdrom:[Ubuntu 20.04 LTS _Focal Fossa_ - Alpha amd64 (20200315)]/ focal main restricted
```

![Execute script](https://gitlab.com/jc.henry/speed-snail/-/raw/master/img/select_prog.png)
