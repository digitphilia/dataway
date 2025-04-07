# -*- encoding: utf-8 -*-

"""
A Simple Setup Script to Initialize the Database

The database initialization setup considers particular modules and
their dependent tables to be created seamlessly. In addition, the
function should be simple enough to be executed manually. The script
uses the class method to initialize the database.

@author:  Debmalya Pramanik
@version: v0.0.1
"""

import os
import sys

import psycopg2 as db

from abc import ABC, abstractmethod

class SetupDB(ABC):
    ROOT = os.path.abspath(os.path.join("..", ".."))
    SEED = os.path.join(ROOT, "seed")

    def __init__(
        self,
        database : str,
        password : str,
        **kwargs
    ) -> None:
        self.engine, self.cursor = self.connect(
            user = kwargs.get("user", "postgres"),
            host = kwargs.get("host", "localhost"),
            port = kwargs.get("port", "5432"),
            database = database,
            password = password
        )


    def connect(
        self,
        user : str,
        host : str,
        port : str,
        database : str,
        password : str,
    ):
        """
        The Unified and Simple Connection Object for PostgreSQL DB

        The connection object internally uses the :mod:`psycopg2` to
        connect to a PostgreSQL database given all the connection
        parameters. The object validates the input parameters and
        sets the class object ``engine`` and ``cursor`` to module.
        """

        engine = db.connect(
            user = user, host = host, port = port,
            database = database, password = password
        )

        cursor = engine.cursor()

        return engine, cursor
