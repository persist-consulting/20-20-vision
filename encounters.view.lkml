view: encounters {
  derived_table: {
    sql: SELECT DISTINCT  e.*, p.first_name, p.last_name,practice.PracticeName,doc.FirstName+' '+doc.LastName as Doctor
      FROM dbo.DimPatientEncounter as e

      LEFT JOIN dbo.DimPatient as p ON e.DimPatientId = p.DimPersonId AND e.DimPracticeId = p.DimPracticeID
      LEFT JOIN dbo.DimPractice as practice ON e.DimPracticeId = practice.DimPracticeId
      LEFT JOIN dbo.DimDoctor as doc ON e.DimDoctorId = doc.DimDoctorId AND e.DimPracticeId = doc.DimPracticeId
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dim_encounter_id {
    type: number
    sql: ${TABLE}.DimEncounterId ;;
  }

  dimension: encounter_id_business_key {
    type: string
    sql: ${TABLE}.encounterIdBusinessKey ;;
  }

  dimension: encounter_nbr {
    type: string
    sql: ${TABLE}.encounter_nbr ;;
  }

  dimension: dim_patient_id {
    type: number
    sql: ${TABLE}.DimPatientId ;;
  }

  dimension: key {
    type: number
    sql: CONCAT(${dim_patient_id},${dim_practice_id}) ;;
  }

  dimension: dim_practice_id {
    type: number
    sql: ${TABLE}.DimPracticeId ;;
  }

  dimension: person_id_business_key {
    type: string
    sql: ${TABLE}.PersonIdBusinessKey ;;
  }

  dimension: practice_id_business_key {
    type: string
    sql: ${TABLE}.PracticeIdBusinessKey ;;
  }

  dimension: encounter_dim_date_id {
    type: number
    sql: ${TABLE}.EncounterDimDateId ;;
  }

  dimension_group: checkin_datetime {
    type: time
    sql: ${TABLE}.checkin_datetime ;;
  }

  dimension_group: checkout_datetime {
    type: time
    sql: ${TABLE}.checkout_datetime ;;
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }

  dimension: dim_doctor_id {
    type: number
    sql: ${TABLE}.DimDoctorId ;;
  }

  dimension: rendering_provider_business_key {
    type: string
    sql: ${TABLE}.RenderingProviderBusinessKey ;;
  }

  dimension: referring_provider_id {
    type: string
    sql: ${TABLE}.referring_provider_id ;;
  }

  dimension: referring_provider_last_name {
    type: string
    sql: ${TABLE}.referring_provider_last_name ;;
  }

  dimension: referring_provider_first_name {
    type: string
    sql: ${TABLE}.referring_provider_first_name ;;
  }

  dimension: referring_provider_middle_name {
    type: string
    sql: ${TABLE}.referring_provider_middle_name ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.createdBy ;;
  }

  dimension_group: created_timestamp {
    type: time
    sql: ${TABLE}.created_timestamp ;;
  }

  dimension: modified_by {
    type: string
    sql: ${TABLE}.modifiedBy ;;
  }

  dimension_group: modified_timestamp {
    type: time
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

  dimension: stg_file_fk {
    type: number
    sql: ${TABLE}.stgFileFK ;;
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

  measure: count_of_unique_patients_seen {
    type: count_distinct
    sql: ${key} ;;
    sql_distinct_key: ${key} ;;
  }

  set: detail {
    fields: [
      dim_encounter_id,
      encounter_id_business_key,
      encounter_nbr,
      dim_patient_id,
      dim_practice_id,
      person_id_business_key,
      practice_id_business_key,
      encounter_dim_date_id,
      checkin_datetime_time,
      checkout_datetime_time,
      location_id,
      location_name,
      dim_doctor_id,
      rendering_provider_business_key,
      referring_provider_id,
      referring_provider_last_name,
      referring_provider_first_name,
      referring_provider_middle_name,
      created_by,
      created_timestamp_time,
      modified_by,
      modified_timestamp_time,
      inserted_by,
      insertion_date_time_time,
      updated_by,
      updation_date_time_time,
      stg_file_fk,
      first_name,
      last_name,
      practice_name,
      doctor
    ]
  }
}
