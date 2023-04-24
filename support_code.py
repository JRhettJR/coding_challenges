import pandas as pd
from sqlalchemy import create_engine

def extract_data(**kwargs):
    """"""
    df = pd.read_csv('data.csv', skiprows=8, parse_dates=['Gregorian date'])
    df.to_csv('tmp_data.csv', index=False)


def transform_data(**kwargs):
    """"""
    df = pd.read_csv('temp_data.csv', parse_dates=['Gregorian date'])
    df.to_csv('transformed_data.csv', index=False)


def load_data(**kwargs):
    """"""
    df = pd.read_csv('transformed_data.csv', parse_dates=['Gregorian date'])
    engine = create_engine('mysql://username:password@localhost/db_name')
    df_dim_date = df[['gregorian_date']].drop_duplicates().reset_index(drop=True)
    df_dim_date.to_sql('dim_date', engine, if_exists='append', index=False)
    engine.dispose()