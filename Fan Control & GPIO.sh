# https://raspberrypi.stackexchange.com/questions/95710/how-to-program-active-cooling-connected-to-gpio/105820#105820
# https://docs.google.com/document/d/1bxIzUXLXdrtTo7DwAYv8maLeBssYau4nWwyeAAjot-0/edit

# Echo CPU temperature in millidegrees
cat /sys/class/thermal/thermal_zone*/temp


# Configure CPU temp fan control
sudo raspi-config


# GPIO
# Export pin
pin=20 &&\
cd /sys/class/gpio &&\
echo $pin > export &&\
cd gpio$pin

# Set direction
echo out > direction

# Set pin data
echo 1 > value
echo 0 > value

# Echo pin
ls gpio$pin

# Unexport pin
cd .. && echo $pin > unexport