view: production {
  derived_table: {
    sql: SELECT t.*, p.first_name, p.last_name,practice.PracticeName,doc.FirstName+' '+doc.LastName as Doctor
      FROM dbo.FactTransactions as t
      LEFT JOIN dbo.DimPatient as p ON t.DimPatientId = p.DimPersonId AND t.DimPracticeId = p.DimPracticeID
      LEFT JOIN dbo.DimPractice as practice ON t.DimPracticeId = practice.DimPracticeId
      LEFT JOIN dbo.DimDoctor as doc ON t.DimDoctorId = doc.DimDoctorId AND t.DimPracticeId = doc.DimPracticeId
       ;;
  }




  dimension: fact_transaction_id {
    type: number
    sql: ${TABLE}.FactTransactionId ;;
  }

  dimension: dim_practice_id {
    type: number
    sql: ${TABLE}.DimPracticeId ;;
  }

  dimension: dim_patient_id {
    type: number
    sql: ${TABLE}.DimPatientId ;;
  }

  dimension: dim_doctor_id {
    type: number
    sql: ${TABLE}.DimDoctorId ;;
  }

  dimension: dim_cptcode_id {
    type: number
    sql: ${TABLE}.DimCPTCodeId ;;
  }

  dimension: dim_payer_id {
    type: number
    sql: ${TABLE}.DimPayerId ;;
  }

  dimension: dim_date_batch_id {
    type: number
    sql: ${TABLE}.DimDateBatchId ;;
  }

  dimension: dim_date_encounter_id {
    type: number
    sql: ${TABLE}.DimDateEncounterId ;;
  }

  dimension: dim_encounter_id {
    type: number
    sql: ${TABLE}.DimEncounterId ;;
  }

  dimension: payer_business_key {
    type: string
    sql: ${TABLE}.payerBusinessKey ;;
  }

  dimension: payer_name {
    type: string
    sql: ${TABLE}.payer_name ;;
  }

  dimension: financial_class {
    type: string
    sql: ${TABLE}.financial_class ;;
  }

  dimension: encounter_business_key {
    type: string
    sql: ${TABLE}.EncounterBusinessKey ;;
  }

  dimension: person_business_key {
    type: string
    sql: ${TABLE}.PersonBusinessKey ;;
  }

  dimension: practice_business_key {
    type: string
    sql: ${TABLE}.practiceBusinessKey ;;
  }

  dimension: charge_business_key {
    type: string
    sql: ${TABLE}.chargeBusinessKey ;;
  }

  dimension: charge_amount {
    type: string
    sql: ${TABLE}.charge_amount ;;
  }

  dimension: paid_amount {
    type: string
    sql: ${TABLE}.paid_amount ;;
  }

  dimension: adjustment_amount {
    type: string
    sql: ${TABLE}.adjustment_amount ;;
  }

  dimension: transaction_date {
    type: string
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension: transaction_amount {
    type: string
    sql: ${TABLE}.transaction_amount ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.createdBy ;;
  }

  dimension_group: transaction_on {
    type: time
    timeframes: [
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.created_timestamp as date) ;;
  }

  dimension: modified_by {
    type: string
    sql: ${TABLE}.modifiedBy ;;
  }

  dimension: modified_timestamp {
    type: string
    sql: ${TABLE}.modified_timestamp ;;
  }

  dimension: inserted_by {
    type: string
    sql: ${TABLE}.insertedBy ;;
  }

  dimension_group: insertion_date_time {
    type: time
    sql: ${TABLE}.insertionDateTime ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updatedBy ;;
  }

  dimension_group: updation_date_time {
    type: time
    sql: ${TABLE}.updationDateTime ;;
  }

  dimension: stg_file_transaction_fk {
    type: number
    sql: ${TABLE}.stgFileTransactionFK ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: practice_name {
    type: string
    sql: ${TABLE}.PracticeName ;;
  }

  dimension: doctor {
    type: string
    sql: ${TABLE}.Doctor ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: paid_amounts {
    type: sum_distinct
    sql: ${paid_amount} ;;
    sql_distinct_key: ${fact_transaction_id} ;;
    drill_fields: [detail*]
  }

  measure: charge_amounts  {
    type: sum_distinct
    sql: ${charge_amount} ;;
    sql_distinct_key: ${fact_transaction_id} ;;
    drill_fields: [detail*]
  }

  measure: adjustment_amounts  {
    type: sum_distinct
    sql: ${adjustment_amount} ;;
    sql_distinct_key: ${fact_transaction_id} ;;
    drill_fields: [detail*]
  }
  measure: transaction_amounts  {
    type: sum_distinct
    sql: ${transaction_amount} ;;
    sql_distinct_key: ${fact_transaction_id} ;;
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      fact_transaction_id,
      dim_practice_id,
      dim_patient_id,
      dim_doctor_id,
      dim_cptcode_id,
      dim_payer_id,
      dim_date_batch_id,
      dim_date_encounter_id,
      dim_encounter_id,
      payer_business_key,
      payer_name,
      financial_class,
      encounter_business_key,
      person_business_key,
      practice_business_key,
      charge_business_key,
      charge_amount,
      paid_amount,
      adjustment_amount,
      transaction_date,
      transaction_type,
      transaction_amount,
      created_by,
      modified_by,
      modified_timestamp,
      inserted_by,
      insertion_date_time_time,
      updated_by,
      updation_date_time_time,
      stg_file_transaction_fk,
      first_name,
      last_name,
      practice_name,
      doctor
    ]
  }
}
