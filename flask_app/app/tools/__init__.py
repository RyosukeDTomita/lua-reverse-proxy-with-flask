from flask import current_app
from flask.cli import AppGroup

from .test import run_hello


# testコマンドを定義して追加
test_tool = AppGroup("test")
test_tool.add_command(run_hello) # test.pyの@click.commandがついているrun_hello()を呼び出す

current_app.cli.add_command(test_tool)

