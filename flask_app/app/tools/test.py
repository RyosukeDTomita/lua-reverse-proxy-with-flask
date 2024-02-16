import click
from .services import TestService


@click.command("hello", help="print Hello, World.")
def run_hello():
    TestService().print_hello()
