FROM python

ENV od="$HOME/.odrive-agent/bin"
ENV PATH="${od}:${PATH}"

# Install odrive Sync Agent
RUN curl -L "https://dl.odrive.com/odrive-py" --create-dirs -o "$od/odrive.py" \
    && curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" \
    && curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/"

# Run the odrive Sync Agent server in the background
ENTRYPOINT nohup "odriveagent">/dev/null

