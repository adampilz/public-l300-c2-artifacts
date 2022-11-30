# create a baseline model
CREATE OR REPLACE MODEL `project.dataset.model`
  OPTIONS(
    model_type='AUTOML_CLASSIFIER'
  , INPUT_LABEL_COLS = ['label']
  , OPTIMIZATION_OBJECTIVE = "MINIMIZE_RMSE"
  , BUDGET_HOURS = 1.0
)
AS
  SELECT *
  FROM `project.dataset.table`
;



# apply baseline model
SELECT *
FROM ML.PREDICT(MODEL `project.dataset.model`
  , ( SELECT * EXCEPT(label) FROM `project.dataset.table` LIMIT 100))
;
