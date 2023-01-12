from cohortextractor import (
    StudyDefinition,
    patients,
    codelist,
    codelist_from_csv,
)  # NOQA


study = StudyDefinition(
    index_date="2020-03-01",
    default_expectations={
        "date": {"earliest": "1900-01-01", "latest": "today"},
        "rate": "uniform",
        "incidence": 0.5,
    },
    population=patients.satisfying("registered"),
    # Define age variable
    age=patients.age_as_of(
        "index_date",
        return_expectations={
            "rate": "universal",
            "int": {"distribution": "population_ages"},
        },
    ),
    # Define registered variable
    registered=patients.registered_as_of(
        "2020-03-31",
        return_expectations={"incidence": 0.9},
    ),
)
