ALTER TABLE cities
ADD CONSTRAINT cities_region_id_fk
FOREIGN KEY (region_id)
REFERENCES regions (id);


ALTER TABLE specializations
ADD CONSTRAINT specializations_industry_id
FOREIGN KEY (industry_id)
REFERENCES industries(id);


ALTER TABLE resume_work_shedule
ADD CONSTRAINT rws_shedule_id_fk
FOREIGN KEY (shedule_id)
REFERENCES work_shedule(id),
ADD CONSTRAINT rws_resumee_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);


ALTER TABLE workers
ADD CONSTRAINT workers_job_search_area_id_fk
FOREIGN KEY (job_search_area_id)
REFERENCES cities(id);


ALTER TABLE mailing_and_notifications
ADD CONSTRAINT mailing_and_notifications_worker_id_fk
FOREIGN KEY (worker_id)
REFERENCES workers(id);


ALTER TABLE employers                
ADD CONSTRAINT employers_industry_id_fk
FOREIGN KEY (industry_id)
REFERENCES industries(id),
ADD CONSTRAINT employers_city_id_fk
FOREIGN KEY (city_id)
REFERENCES cities(id);


ALTER TABLE reviews_of_employers
ADD CONSTRAINT reviews_of_employers_employer_id_fk
FOREIGN KEY(employer_id)
REFERENCES employers (id);


--
ALTER TABLE mailing_and_notifications
ADD CONSTRAINT mailing_and_notifications_worker_id_fk
FOREIGN KEY (worker_id)
REFERENCES workers(id);


ALTER TABLE workers_resume
ADD CONSTRAINT workers_resume_worker_id_fk
FOREIGN KEY (worker_id)
REFERENCES workers(id),
ADD CONSTRAINT workers_resume_visibility_id_fk
FOREIGN KEY (visibility_id)
REFERENCES visibility_resume(id);


ALTER TABLE resume_personal_info
ADD CONSTRAINT resume_personal_info_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);


ALTER TABLE resume_education
ADD CONSTRAINT resume_education_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);


ALTER TABLE resume_busyness
ADD CONSTRAINT resume_busyness_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id),
ADD CONSTRAINT resume_busyness_busyness_id_fk
FOREIGN KEY (busyness_id)
REFERENCES busyness(id);


ALTER TABLE resume_position_and_salary
ADD CONSTRAINT rpas_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id),
ADD CONSTRAINT rpas_specialization_id_fk
FOREIGN KEY (specialization_id)
REFERENCES specializations(id);


ALTER TABLE resume_portfolio          
ADD CONSTRAINT resume_portfolio_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);


ALTER TABLE job_openings    
ADD CONSTRAINT job_openings_employer_id_fk
FOREIGN KEY (employer_id)
REFERENCES employers(id),
ADD CONSTRAINT job_openings_work_experience_id_fk
FOREIGN KEY (work_experience_id)
REFERENCES work_experience(id),
ADD CONSTRAINT job_openings_work_shedule_id_fk
FOREIGN KEY (work_shedule_id)
REFERENCES work_shedule(id),
ADD CONSTRAINT job_openings_busyness_id_fk
FOREIGN KEY (busyness_id)
REFERENCES busyness(id);


ALTER TABLE employee_responses
ADD CONSTRAINT employee_responses_worker_id_fk
FOREIGN KEY (worker_id)
REFERENCES workers(id),
ADD CONSTRAINT employee_responses_job_opening_id_fk
FOREIGN KEY (job_opening_id)
REFERENCES job_openings(id),
ADD CONSTRAINT employee_responses_employer_feedback_id_fk
FOREIGN KEY (employer_feedback_id)
REFERENCES employer_feedbacks(id);


ALTER TABLE messages
ADD CONSTRAINT messages_worker_id_fk
FOREIGN KEY (worker_id)
REFERENCES workers(id),
ADD CONSTRAINT messages_employer_id_fk
FOREIGN KEY (employer_id)
REFERENCES employers(id);


ALTER TABLE resume_tests_and_exams
ADD CONSTRAINT rtae_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);


ALTER TABLE resume_electronic_certificates
ADD CONSTRAINT resume_electronic_certificates_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);


ALTER TABLE resume_languages
ADD CONSTRAINT resume_languages_resume_id_fk
FOREIGN KEY (resume_id)
REFERENCES workers_resume(id);