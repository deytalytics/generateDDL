from sqlalchemy import create_engine, MetaData
from sqlalchemy.schema import CreateTable
import os

if __name__ == '__main__':
    user = os.getenv('user')
    password = os.getenv('password')
    host = os.getenv('host')
    dbname = os.getenv('dbname')
    schema = os.getenv('schema')
    conn_string = f'postgresql+psycopg2://{user}:{password}@{host}:5432/{dbname}'
    print(conn_string)
    engine = create_engine(conn_string)
    print(f"Connected to server:{host} database:{dbname}")
    metadata = MetaData()
    metadata.reflect(engine,schema=schema)

    # Generate the DDL for creating the tables
    with open(f'{dbname}-{schema}.ddl', 'w') as f:
        for table in metadata.sorted_tables:
            f.write(str(CreateTable(table).compile(engine)).strip()+";")
            f.write('\n\n')
            for index in table.indexes:
                f.write(str(CreateIndex(index)).strip()+";")
                f.write('\n\n')
