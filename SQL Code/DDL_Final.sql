use vaxchi;

CREATE TABLE IF NOT EXISTS `vaxchi`.`dim_zipcode` (
  `zipcode_id` SMALLINT(3) NOT NULL,
  `zipcode` INT NOT NULL,
  `city` CHAR(7) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `population` INT NULL,
  PRIMARY KEY (`zipcode_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vaxchi`.`dim_ccvi` (
  `ccvi_id` SMALLINT(3) NOT NULL,
  `zipcode_id` SMALLINT(3) NOT NULL,
  `ccvi_score` FLOAT NOT NULL,
  `ccvi_category` CHAR(6) NOT NULL,
  PRIMARY KEY (`ccvi_id`),
  INDEX `fk_dim_ccvi_dim_zipcode_idx` (`zipcode_id` ASC) VISIBLE,
  CONSTRAINT `fk_dim_ccvi_dim_zipcode`
    FOREIGN KEY (`zipcode_id`)
    REFERENCES `vaxchi`.`dim_zipcode` (`zipcode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vaxchi`.`dim_date` (
  `date_id` SMALLINT(3) NOT NULL,
  `full_date` DATE NOT NULL,
  `month` VARCHAR(45) NOT NULL,
  `year` SMALLINT(4) NOT NULL,
  PRIMARY KEY (`date_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vaxchi`.`dim_test_loc` (
  `test_facility_id` SMALLINT(4) NOT NULL,
  `zipcode_id` SMALLINT(3) NOT NULL,
  `facility_test_name` VARCHAR(150) NOT NULL,
  `phone_test` CHAR(14) NOT NULL,
  `web_site_test` VARCHAR(150) NOT NULL,
  `address_test` VARCHAR(45) NOT NULL,
  `city` CHAR(7) NOT NULL,
  `state` CHAR(2) NOT NULL,
  PRIMARY KEY (`test_facility_id`),
  INDEX `fk_dim_test_loc_dim_zipcode1_idx` (`zipcode_id` ASC) VISIBLE,
  CONSTRAINT `fk_dim_test_loc_dim_zipcode1`
    FOREIGN KEY (`zipcode_id`)
    REFERENCES `vaxchi`.`dim_zipcode` (`zipcode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

drop table `vaxchi`.`dim_vax_loc`;

CREATE TABLE IF NOT EXISTS `vaxchi`.`dim_vax_loc` (
  `vax_facility_id` SMALLINT(4) NOT NULL,
  `zipcode_id` SMALLINT(3) NOT NULL,
  `facility_vax_name` VARCHAR(150) NOT NULL,
  `phone_vax` CHAR(14) NULL,
  `website_vax` VARCHAR(150) NOT NULL,
  `address_vax` VARCHAR(45) NOT NULL,
  `city` CHAR(7) NOT NULL,
  `state` CHAR(2) NOT NULL,
  PRIMARY KEY (`vax_facility_id`),
  INDEX `fk_dim_vax_loc_dim_zipcode1_idx` (`zipcode_id` ASC) VISIBLE,
  CONSTRAINT `fk_dim_vax_loc_dim_zipcode1`
    FOREIGN KEY (`zipcode_id`)
    REFERENCES `vaxchi`.`dim_zipcode` (`zipcode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `vaxchi`.`fact_vaxchi` (
  `vaxchi_id` SMALLINT(5) NOT NULL,
  `zipcode_id` SMALLINT(3) NOT NULL,
  `date_id` SMALLINT(3) NOT NULL,
  `sum_total_first_doses` INT NOT NULL,
  `sum_total_second_doses` INT NOT NULL,
  `sum_first_dose_5_11` INT NOT NULL,
  `sum_first_dose_12_17` INT NOT NULL,
  `sum_first_dose_18_64` INT NOT NULL,
  `sum_first_dose_65_plus` INT NOT NULL,
  `sum_second_dose_5_11` INT NOT NULL,
  `sum_second_dose_12_17` INT NOT NULL,
  `sum_second_dose_18_64` INT NOT NULL,
  `sum_second_dose_65_plus` INT NOT NULL,
  `sum_covid_cases` INT NULL,
  `sum_covid_tests` INT NULL,
  `sum_covid_deaths` INT NOT NULL,
  PRIMARY KEY (`vaxchi_id`),
  INDEX `fk_fact_vaxchi_dim_zipcode1_idx` (`zipcode_id` ASC) VISIBLE,
  INDEX `fk_fact_vaxchi_dim_date1_idx` (`date_id` ASC) VISIBLE,
  CONSTRAINT `fk_fact_vaxchi_dim_zipcode1`
    FOREIGN KEY (`zipcode_id`)
    REFERENCES `vaxchi`.`dim_zipcode` (`zipcode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_vaxchi_dim_date1`
    FOREIGN KEY (`date_id`)
    REFERENCES `vaxchi`.`dim_date` (`date_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




