[Unit]
Description=Odrive Sync Agent

[Service]
ExecStart=odriveagent

[Install]
WantedBy=multi-user.target
