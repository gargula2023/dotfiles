import Xmobar

config = defaultConfig { 
font = "Hack Nerd Font Propo 14"
, bgColor = "black"
, fgColor = "white"
, position = TopH 32
, lowerOnStart = True
, commands = [ Run $ Network "enp7s0" ["-L","0","-H","32","--normal","green","--high","red"] 1000
             , Run $ Cpu ["-t", "<total>%"] 300
             , Run $ Memory ["-t","<used>G/<total>G", "--", "--scale", "1024"] 10
             , Run $ DynNetwork ["-t"," <rx>Kb/s <rxbar>|<tx> kb/s <txbar>"] 10

             , Run $ DiskU [("/", "<used>/<size>")]["-L", "20", "-H", "50", "-m", "1", "-p", "3"] 20

             , Run $ Com "/home/gargula/dotfiles/bin/nvidia-utilization.sh" [] "nvidiaUtilization" 100

             , Run $ Com "uname" ["-s","-r"] "uname" 100

             , Run $ Date "%H:%M:%S" "date" 10
             , Run $ K10Temp "0000:00:18.3" ["-t", "/<Tctl>°C","-L", "40", "-H", "60","-l", "lightblue", "-n", "green", "-h", "red"] 50 
             ]
, sepChar = "%"
, alignSep = "}{"
, template = "  }{ %nvidiaUtilization% %uname% %cpu%%k10temp%  %memory% %disku% %dynnetwork% %date%          "
}

main :: IO ()
main = configFromArgs config >>= xmobar
