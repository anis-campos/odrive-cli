FROM python

ENV od="$HOME/.odrive-agent/bin"
ENV PATH="${od}:${PATH}"

# Install odrive Sync Agent
RUN curl -L "https://dl.odrive.com/odrive-py" --create-dirs -o "$od/odrive.py" \
    && curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" \
    && curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/"
    
ADD odriveService.sh /etc/service/odrive/run
RUN chmod 755 /etc/service/odrive/run


# Run the odrive Sync Agent server as a service in the background
ENTRYPOINT service odrive start && bash

