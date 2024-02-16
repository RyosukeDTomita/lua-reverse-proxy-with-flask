from flask import current_app
from flask.cli import AppGroup

from .test import run_hello


test_tool = AppGroup("test")
test_tool.add_command(run_hello)

current_app.cli.add_command(test_tool)

