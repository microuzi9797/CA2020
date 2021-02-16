FROM ntuca2020/hw5:latest

COPY HW5.scala /rocket-chip/src/main/scala/system/

# Cleanup
RUN apt-get autoremove -y && apt-get autoclean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

