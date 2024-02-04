-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`user_army`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`user_army` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `faction_id` INT NOT NULL,
  `type` INT NULL COMMENT '1: combat patrol, 2:incursion, 3:strike force, 4:onslaught',
  `total_points` INT NULL DEFAULT 0,
  `edition` INT NULL,
  `balance_version` DECIMAL(2,2) NOT NULL COMMENT 'dataSlate.errata',
  PRIMARY KEY (`id`),
  CONSTRAINT `user_id1`
    FOREIGN KEY (`user_id2`)
    REFERENCES `db2at0k0xhmzqi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `game_id2`
    FOREIGN KEY (`game_id`)
    REFERENCES `db2at0k0xhmzqi`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `faction_id`
    FOREIGN KEY (`faction_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE4` ON `db2at0k0xhmzqi`.`user_army` (`id` ASC);

CREATE INDEX `user_id_idx` ON `db2at0k0xhmzqi`.`user_army` (`user_id` ASC);

CREATE INDEX `game_id_idx` ON `db2at0k0xhmzqi`.`user_army` (`game_id` ASC);

CREATE INDEX `faction_id_idx` ON `db2at0k0xhmzqi`.`user_army` (`faction_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`user_army_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`user_army_list` (
  `id` INT NOT NULL,
  `army_list_id` INT NOT NULL,
  `unit_id` INT NOT NULL,
  `datasheet_id` INT NULL,
  `divider` VARCHAR(45) NULL,
  `leader_to` INT NULL,
  `bodyguard_to` INT NULL,
  `warlord` TINYINT NULL,
  `enhancement` INT NULL,
  `wargear` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `army_list_id`
    FOREIGN KEY (`army_list_id`)
    REFERENCES `db2at0k0xhmzqi`.`user_army` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE5` ON `db2at0k0xhmzqi`.`user_army_list` (`id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`user_admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`user_admin` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  `admin_token` VARCHAR(45) NOT NULL,
  `registered` DATE NOT NULL,
  `deleted` DATE NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_id3`
    FOREIGN KEY (`user_id`)
    REFERENCES `db2at0k0xhmzqi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE6` ON `db2at0k0xhmzqi`.`user_admin` (`id` ASC);

CREATE UNIQUE INDEX `user_admincol_UNIQUE` ON `db2at0k0xhmzqi`.`user_admin` (`user_id` ASC);

CREATE UNIQUE INDEX `admin_token_UNIQUE` ON `db2at0k0xhmzqi`.`user_admin` (`admin_token` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`game_keyword_unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`game_keyword_unit` (
  `id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `type` INT NOT NULL COMMENT 'type = 1:unit\n',
  `name` VARCHAR(45) NOT NULL,
  `modifer` VARCHAR(45) NULL,
  `characteristic` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `game_id2`
    FOREIGN KEY (`game_id`)
    REFERENCES `db2at0k0xhmzqi`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `game_id_idx` ON `db2at0k0xhmzqi`.`game_keyword_unit` (`game_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`faction_unit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`faction_unit` (
  `id` INT NOT NULL,
  `faction_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `edition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `faction_id3`
    FOREIGN KEY (`faction_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE10` ON `db2at0k0xhmzqi`.`faction_unit` (`id` ASC);

CREATE INDEX `faction_id_idx2` ON `db2at0k0xhmzqi`.`faction_unit` (`faction_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`datasheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`datasheet` (
  `id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `faction_id` INT NOT NULL,
  `faction_unit_id` INT NOT NULL,
  `type` INT NOT NULL COMMENT '1:characters, 2:battleline, 3:dedicated transports, 4:other datasheets',
  `movement` INT NOT NULL,
  `toughness` INT NOT NULL,
  `save` INT NOT NULL,
  `wound` INT NOT NULL,
  `leadership` INT NOT NULL,
  `object_control` INT NOT NULL,
  `ranged_weapon` VARCHAR(100) NULL,
  `melee_weapon` VARCHAR(100) NULL,
  `unit_composition_min` INT NULL DEFAULT 1,
  `unit_composition_shift` INT NULL DEFAULT 0,
  `unit_composition_max` INT NULL DEFAULT 1,
  `keywords` VARCHAR(100) NOT NULL,
  `faction_keyword` VARCHAR(45) NOT NULL,
  `invulnerable save` INT NULL DEFAULT NULL,
  `points` INT NULL,
  `balance_version` DECIMAL(2,2) NOT NULL COMMENT 'dataSlate.errata',
  `edition` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `game_id3`
    FOREIGN KEY (`game_id`)
    REFERENCES `db2at0k0xhmzqi`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `faction_id4`
    FOREIGN KEY (`faction_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `faction_unit_id`
    FOREIGN KEY (`faction_unit_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction_unit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE11` ON `db2at0k0xhmzqi`.`datasheet` (`id` ASC);

CREATE INDEX `game_id_idx2` ON `db2at0k0xhmzqi`.`datasheet` (`game_id` ASC);

CREATE INDEX `faction_id_idx3` ON `db2at0k0xhmzqi`.`datasheet` (`faction_id` ASC);

CREATE INDEX `faction_unit_id_idx` ON `db2at0k0xhmzqi`.`datasheet` (`faction_unit_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`game_setting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`game_setting` (
  `id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `type` INT NOT NULL COMMENT '1: deployment, 2:primary mission, 3:secondary mission, 4:gambit',
  `name` VARCHAR(45) NOT NULL,
  `edition` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `game_id4`
    FOREIGN KEY (`game_id`)
    REFERENCES `db2at0k0xhmzqi`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE12` ON `db2at0k0xhmzqi`.`game_setting` (`id` ASC);

CREATE INDEX `game_id_idx3` ON `db2at0k0xhmzqi`.`game_setting` (`game_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `last_round` INT NULL DEFAULT 1,
  `privacy` INT NULL DEFAULT 1 COMMENT '1:public, 2:limited share, 3:private',
  `primary_mission_id` INT NOT NULL,
  `deployment_id` INT NOT NULL,
  `status` INT NULL COMMENT '1:active, 2:deleting, 3:deleted',
  `registered` DATE NULL,
  `updated` DATE NULL,
  `deleted` DATE NULL,
  `location` VARCHAR(100) NULL,
  `edition` INT NOT NULL,
  `balance_version` DECIMAL(2,2) NOT NULL COMMENT 'dataSlate.errata',
  PRIMARY KEY (`id`),
  CONSTRAINT `user_id4`
    FOREIGN KEY (`user_id`)
    REFERENCES `db2at0k0xhmzqi`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `game_id5`
    FOREIGN KEY (`game_id`)
    REFERENCES `db2at0k0xhmzqi`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `primary_missin_id`
    FOREIGN KEY (`primary_mission_id`)
    REFERENCES `db2at0k0xhmzqi`.`game_setting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `deployment_id`
    FOREIGN KEY (`deployment_id`)
    REFERENCES `db2at0k0xhmzqi`.`game_setting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE13` ON `db2at0k0xhmzqi`.`battle` (`id` ASC);

CREATE INDEX `user_id_idx2` ON `db2at0k0xhmzqi`.`battle` (`user_id` ASC);

CREATE INDEX `game_id_idx4` ON `db2at0k0xhmzqi`.`battle` (`game_id` ASC);

CREATE INDEX `primary_missin_id_idx` ON `db2at0k0xhmzqi`.`battle` (`primary_mission_id` ASC);

CREATE INDEX `deployment_id_idx` ON `db2at0k0xhmzqi`.`battle` (`deployment_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_rounds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_rounds` (
  `id` INT NOT NULL,
  `battle_id` INT NOT NULL,
  `round_number` INT NOT NULL,
  `turn` INT NOT NULL COMMENT '1:attacker, 2:defender',
  `score` INT NULL DEFAULT 0,
  `secondary_mission` VARCHAR(200) NULL,
  `command_point` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `battle_id`
    FOREIGN KEY (`battle_id`)
    REFERENCES `db2at0k0xhmzqi`.`battle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE14` ON `db2at0k0xhmzqi`.`battle_rounds` (`id` ASC);

CREATE INDEX `battle_id_idx` ON `db2at0k0xhmzqi`.`battle_rounds` (`battle_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_rounds_combat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_rounds_combat` (
  `id` INT NOT NULL,
  `rounds_id` INT NOT NULL,
  `attacker_unit` VARCHAR(45) NULL,
  `target_unit` VARCHAR(45) NULL,
  `damage` INT NULL DEFAULT 0,
  `attacker_army_list_id` INT NULL,
  `target_army_list_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rounds_id`
    FOREIGN KEY (`rounds_id`)
    REFERENCES `db2at0k0xhmzqi`.`battle_rounds` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE15` ON `db2at0k0xhmzqi`.`battle_rounds_combat` (`id` ASC);

CREATE INDEX `rounds_id_idx` ON `db2at0k0xhmzqi`.`battle_rounds_combat` (`rounds_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`game_keyword_weapon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`game_keyword_weapon` (
  `id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `type` INT NULL COMMENT 'type = 1:range, 2:melee\n',
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `game_id6`
    FOREIGN KEY (`game_id`)
    REFERENCES `db2at0k0xhmzqi`.`games` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE17` ON `db2at0k0xhmzqi`.`game_keyword_weapon` (`id` ASC);

CREATE INDEX `game_id_idx6` ON `db2at0k0xhmzqi`.`game_keyword_weapon` (`game_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`datasheet_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`datasheet_detail` (
  `id` INT NOT NULL,
  `datasheet_id` INT NULL,
  `type` INT NULL COMMENT 'type = 1:core, 2:ability, 3:leader',
  PRIMARY KEY (`id`),
  CONSTRAINT `datasheet_id`
    FOREIGN KEY (`datasheet_id`)
    REFERENCES `db2at0k0xhmzqi`.`datasheet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE18` ON `db2at0k0xhmzqi`.`datasheet_detail` (`id` ASC);

CREATE INDEX `datasheet_id_idx` ON `db2at0k0xhmzqi`.`datasheet_detail` (`datasheet_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_rounds_movement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_rounds_movement` (
  `id` INT NOT NULL,
  `rounds_id` INT NOT NULL,
  `type` INT NULL COMMENT '1: normal, 2:advance, 3:fallback, 4:escape',
  `moved` TINYINT NULL DEFAULT NULL,
  `unit_id` INT NULL,
  `army_list_id` INT NULL,
  `grid1` VARCHAR(45) NULL,
  `grid2` VARCHAR(45) NULL,
  `grid3` VARCHAR(45) NULL,
  `grid4` VARCHAR(45) NULL,
  `inch` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rounds_id2`
    FOREIGN KEY (`rounds_id`)
    REFERENCES `db2at0k0xhmzqi`.`battle_rounds` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE20` ON `db2at0k0xhmzqi`.`battle_rounds_movement` (`id` ASC);

CREATE INDEX `rounds_id_idx3` ON `db2at0k0xhmzqi`.`battle_rounds_movement` (`rounds_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_rounds_command`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_rounds_command` (
  `id` INT NOT NULL,
  `rounds_id` INT NULL,
  `memo` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rounds_id3`
    FOREIGN KEY (`rounds_id`)
    REFERENCES `db2at0k0xhmzqi`.`battle_rounds` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE21` ON `db2at0k0xhmzqi`.`battle_rounds_command` (`id` ASC);

CREATE INDEX `rounds_id_idx4` ON `db2at0k0xhmzqi`.`battle_rounds_command` (`rounds_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`faction_detachment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`faction_detachment` (
  `id` INT NOT NULL,
  `faction_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `edition` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `faction_id5`
    FOREIGN KEY (`faction_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE22` ON `db2at0k0xhmzqi`.`faction_detachment` (`id` ASC);

CREATE INDEX `faction_id_idx4` ON `db2at0k0xhmzqi`.`faction_detachment` (`faction_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`datasheet_weapon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`datasheet_weapon` (
  `id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `faction_id` INT NOT NULL,
  `type` INT NOT NULL COMMENT '1: range, 2:melee',
  `name` VARCHAR(45) NOT NULL,
  `range` INT NULL,
  `attack` VARCHAR(10) NULL,
  `skill` INT NULL,
  `strength` INT NULL,
  `penetration` INT NULL,
  `damage` VARCHAR(45) NULL,
  `class` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE23` ON `db2at0k0xhmzqi`.`datasheet_weapon` (`id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`faction_detachment_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`faction_detachment_detail` (
  `id` INT NOT NULL,
  `detachment_id` INT NOT NULL,
  `type` INT NULL COMMENT '1:stratagem\n',
  `name` VARCHAR(100) NOT NULL,
  `modifier` VARCHAR(45) NULL,
  `characteristic` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `detachment_id`
    FOREIGN KEY (`detachment_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction_detachment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE24` ON `db2at0k0xhmzqi`.`faction_detachment_detail` (`id` ASC);

CREATE INDEX `detachment_id_idx` ON `db2at0k0xhmzqi`.`faction_detachment_detail` (`detachment_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_rounds_combat_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_rounds_combat_detail` (
  `id` INT NOT NULL,
  `combat_id` INT NOT NULL,
  `type` VARCHAR(45) NULL COMMENT '1:hit roll, 2:wound roll, 3:save roll, 4:damage roll',
  `factor1` VARCHAR(50) NULL,
  `factor1_characteristic` INT NULL,
  `factor1_memo` VARCHAR(400) NULL,
  `factor2` VARCHAR(50) NULL,
  `factor2_characteristic` INT NULL,
  `factor2_memo` VARCHAR(400) NULL,
  `factor3` VARCHAR(50) NULL,
  `factor3_characteristic` INT NULL,
  `factor3_memo` VARCHAR(400) NULL,
  `factor4` VARCHAR(50) NULL,
  `factor4_characteristic` INT NULL,
  `factor4_memo` VARCHAR(400) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `combat_id`
    FOREIGN KEY (`combat_id`)
    REFERENCES `db2at0k0xhmzqi`.`battle_rounds_combat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE25` ON `db2at0k0xhmzqi`.`battle_rounds_combat_detail` (`id` ASC);

CREATE INDEX `combat_id_idx` ON `db2at0k0xhmzqi`.`battle_rounds_combat_detail` (`combat_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_rounds_stratagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_rounds_stratagem` (
  `id` INT NOT NULL,
  `rounds_id` INT NULL,
  `stratagem_id` INT NOT NULL,
  `phase` VARCHAR(45) NULL,
  `target` VARCHAR(45) NULL,
  `target_army_list_id` INT NULL DEFAULT NULL,
  `modifier` VARCHAR(45) NULL,
  `characteristic` INT NULL,
  `used_command_point` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `stratagem_id`
    FOREIGN KEY (`stratagem_id`)
    REFERENCES `db2at0k0xhmzqi`.`faction_detachment_detail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rounds_id4`
    FOREIGN KEY (`rounds_id`)
    REFERENCES `db2at0k0xhmzqi`.`battle_rounds` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE126` ON `db2at0k0xhmzqi`.`battle_rounds_stratagem` (`id` ASC);

CREATE INDEX `stratagem_id_idx` ON `db2at0k0xhmzqi`.`battle_rounds_stratagem` (`stratagem_id` ASC);

CREATE INDEX `rounds_id_idx5` ON `db2at0k0xhmzqi`.`battle_rounds_stratagem` (`rounds_id` ASC);


-- -----------------------------------------------------
-- Table `db2at0k0xhmzqi`.`battle_player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db2at0k0xhmzqi`.`battle_player` (
  `id` INT NOT NULL,
  `battle_id` INT NOT NULL,
  `turn` INT NULL COMMENT '1: attacker, 2:defender',
  `name` VARCHAR(45) NULL,
  `user_id` INT NULL,
  `score` INT NULL,
  `faction_id` INT NULL,
  `detachment_id` INT NULL,
  `army_list_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE27` ON `db2at0k0xhmzqi`.`battle_player` (`id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`games`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`games` (`id`, `name`) VALUES (1, 'warhammer40k');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`faction`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (1, 1, 'Adepta Sororitas');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (2, 1, 'Adeptus Custodes');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (3, 1, 'Adeptus Mechanicus');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (4, 1, 'Aeldari');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (5, 1, 'Astra Militarum');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (6, 1, 'Chaos Daemons');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (7, 1, 'Chaos Knights');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (8, 1, 'Chaos Space Marines');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (9, 1, 'Chaos Titan Legions');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (10, 1, 'Death Guard');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (11, 1, 'Drukhari');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (12, 1, 'Genestealer Cults');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (13, 1, 'Grey Knights');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (14, 1, 'Imperial Agents');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (15, 1, 'Imperial Knights');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (16, 1, 'Leagues of Votann');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (17, 1, 'Necrons');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (18, 1, 'Orks');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (19, 1, 'Adeptus Astartes');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (20, 1, 'Black Templars');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (21, 1, 'Blood Angels');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (22, 1, 'Dark Angels');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (23, 1, 'Deathwatch');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (24, 1, 'Imperial Fists');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (25, 1, 'Iron Hands');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (26, 1, 'Raven Guard');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (27, 1, 'Salamanders');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (28, 1, 'Space Wolves');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (29, 1, 'Ultramarines');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (30, 1, 'White Scars');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (31, 1, 'Thousand Sons');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (32, 1, 'Titan Legions');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (33, 1, 'Tyranids');
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (34, 1, "T'au Empire");
INSERT INTO `db2at0k0xhmzqi`.`faction` (`id`, `game_id`, `name`) VALUES (35, 1, 'World Eaters');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`game_keyword_unit`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (1, 1, 1, 'Infantry', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (2, 1, 1, 'Character', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (3, 1, 1, 'Grenades', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (4, 1, 1, 'Imperium', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (5, 1, 1, 'Tacticus', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (6, 1, 1, 'Primaris', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (7, 1, 1, 'Captain', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (8, 1, 1, 'Gravis', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (9, 1, 1, 'Phobos', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (10, 1, 1, 'Terminator', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (11, 1, 1, 'Jump Pack', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (12, 1, 1, 'Fly', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (13, 1, 1, 'Smoke', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (14, 1, 1, 'Psyker', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (15, 1, 1, 'Librarian', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (16, 1, 1, 'Terminator', '','' );
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (17, 1, 1, 'Chaplain', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (18, 1, 1, 'Mounted', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (19, 1, 1, 'Battleline', '','' );
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (20, 1, 1, 'Primaris Ancient', '','' );
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (21, 1, 1, 'Centurion', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (22, 1, 1, 'Vehicle', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (23, 1, 1, 'Walker', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (24, 1, 1, 'Dreadnought', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (25, 1, 1, 'Artillery', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (26, 1, 1, 'Transport', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (27, 1, 1, 'Dedicated Transport', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (28, 1, 1, 'Aircraft', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (29, 1, 1, 'Fortification', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (30, 1, 1, 'Epic Hero', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (31, 1, 1, 'Chapter Master', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (32, 1, 1, 'Monster', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (33, 1, 1, 'Primarch', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (34, 1, 1, 'Chaos', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (35, 1, 1, 'War Dog', '','' );
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (36, 1, 1, 'Titanic', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (37, 1, 1, 'Towering', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (38, 1, 1, 'Abhorrent', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (39, 1, 1, 'Armiger', '', '');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (40, 1, 1, 'Questoris', '','' );
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_unit` (`id`, `game_id`, `type`, `name`, `modifer`, `characteristic`) VALUES (41, 1, 1, 'Dominus', '', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`faction_unit`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (1, 1, 'Aestred Thurga and Agathae Dolan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (2, 1, 'Arco-flagellants', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (3, 1, 'Battle Sisters Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (4, 1, 'Canoness', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (5, 1, 'Castigator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (6, 1, 'Celestian Sacresants', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (7, 1, 'Crusaders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (8, 1, 'Daemonifuge', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (9, 1, 'Death Cult Assassins', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (10, 1, 'Dialogus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (11, 1, 'Dogmata', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (12, 1, 'Dominion Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (13, 1, 'Exorcist', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (14, 1, 'Hospitaller', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (15, 1, 'Imagifier', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (16, 1, 'Immolator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (17, 1, 'Junith Eruita', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (18, 1, 'Missionary', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (19, 1, 'Mortifiers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (20, 1, 'Morvenn Vahl', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (21, 1, 'Palatine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (22, 1, 'Paragon Warsuits', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (23, 1, 'Penitent Engines', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (24, 1, 'Preacher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (25, 1, 'Repentia Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (26, 1, 'Retributor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (27, 1, 'Saint Celestine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (28, 1, 'Seraphim Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (29, 1, 'Sisters Novitiate Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (30, 1, 'Sororitas Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (31, 1, 'Triumph of Saint Katherine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (32, 1, 'Zephyrim Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (33, 2, 'Aleya', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (34, 2, 'Allarus Custodians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (35, 2, 'Anathema Psykana Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (36, 2, 'Blade Champion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (37, 2, 'Custodian Guard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (38, 2, 'Custodian Wardens', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (39, 2, 'Knight-Centura', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (40, 2, 'Prosecutors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (41, 2, 'Shield-Captain', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (42, 2, 'Shield-Captain in Allarus Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (43, 2, 'Shield-Captain on Dawneagle Jetbike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (44, 2, 'Trajann Valoris', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (45, 2, 'Valerian', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (46, 2, 'Venerable Contemptor Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (47, 2, 'Venerable Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (48, 2, 'Vertus Praetors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (49, 2, 'Vigilators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (50, 2, 'Witchseekers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (51, 2, 'Agamatus Custodians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (52, 2, 'Aquilon Custodians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (53, 2, 'Ares Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (54, 2, 'Caladius Grav-tank', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (55, 2, 'Contemptor-Achillus Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (56, 2, 'Contemptor-Galatus Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (57, 2, 'Coronus Grav-carrier', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (58, 2, 'Custodian Guard with Adrasite', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (59, 2, 'and Pyrithite Spears', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (60, 2, 'Orion Assault Dropship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (61, 2, 'Pallas Grav-attack', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (62, 2, 'Sagittarum Custodians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (63, 2, 'Telemon Heavy Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (64, 2, 'Venatari Custodians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (65, 3, 'Archaeopter Fusilave', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (66, 3, 'Archaeopter Stratoraptor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (67, 3, 'Archaeopter Transvector', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (68, 3, 'Belisarius Cawl', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (69, 3, 'Corpuscarii Electro-Priests', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (70, 3, 'Cybernetica Datasmith', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (71, 3, 'Fulgurite Electro-Priests', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (72, 3, 'Ironstrider Ballistarii', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (73, 3, 'Kastelan Robots', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (74, 3, 'Kataphron Breachers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (75, 3, 'Kataphron Destroyers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (76, 3, 'Onager Dunecrawler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (77, 3, 'Pteraxii Skystalkers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (78, 3, 'Pteraxii Sterylizors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (79, 3, 'Serberys Raiders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (80, 3, 'Serberys Sulphurhounds', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (81, 3, 'Sicarian Infiltrators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (82, 3, 'Sicarian Ruststalkers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (83, 3, 'Skitarii Marshal', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (84, 3, 'Skitarii Rangers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (85, 3, 'Skitarii Vanguard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (86, 3, 'Skorpius Disintegrator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (87, 3, 'Skorpius Dunerider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (88, 3, 'Sydonian Dragoons with Radium Jezzails', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (89, 3, 'Sydonian Dragoons with Taser Lances', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (90, 3, 'Sydonian Skatros', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (91, 3, 'Tech-Priest Dominus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (92, 3, 'Tech-Priest Enginseer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (93, 3, 'Tech-Priest Manipulus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (94, 3, 'Technoarcheologist', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (95, 32, 'Reaver Titan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (96, 32, 'Warbringer Nemesis Titan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (97, 32, 'Warhound Titan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (98, 32, 'Warlord Titan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (99, 4, 'Asurmen', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (100, 4, 'Autarch', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (101, 4, 'Autarch Skyrunner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (102, 4, 'Autarch Wayleaper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (103, 4, 'Avatar of Khaine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (104, 4, 'Baharroth', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (105, 4, 'Corsair Voidreavers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (106, 4, 'Corsair Voidscarred', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (107, 4, 'Crimson Hunter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (108, 4, 'Dark Reapers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (109, 4, 'Death Jester', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (110, 4, 'Dire Avengers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (111, 4, 'Eldrad Ulthran', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (112, 4, 'Falcon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (113, 4, 'Farseer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (114, 4, 'Farseer Skyrunner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (115, 4, 'Fire Dragons', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (116, 4, 'Fire Prism', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (117, 4, 'Fuegan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (118, 4, 'Guardian Defenders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (119, 4, 'Hemlock Wraithfighter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (120, 4, 'Howling Banshees', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (121, 4, 'Illic Nightspear', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (122, 4, 'Jain Zar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (123, 4, 'Karandras', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (124, 4, 'Maugan Ra', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (125, 4, 'Night Spinner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (126, 4, 'Prince Yriel', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (127, 4, 'Rangers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (128, 4, 'Shadowseer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (129, 4, 'Shining Spears', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (130, 4, 'Shroud Runners', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (131, 4, 'Skyweavers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (132, 4, 'Solitaire', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (133, 4, 'Spiritseer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (134, 4, 'Starweaver', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (135, 4, 'Storm Guardians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (136, 4, 'Striking Scorpions', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (137, 4, 'Support Weapons', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (138, 4, 'Swooping Hawks', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (139, 4, 'The Visarch', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (140, 4, 'The Yncarne', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (141, 4, 'Troupe', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (142, 4, 'Troupe Master', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (143, 4, 'Voidweaver', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (144, 4, 'Vyper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (145, 4, 'War Walker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (146, 4, 'Warlock', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (147, 4, 'Warlock Conclave', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (148, 4, 'Warlock Skyrunner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (149, 4, 'Warlock Skyrunner Conclave', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (150, 4, 'Warp Spiders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (151, 4, 'Wave Serpent', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (152, 4, 'Webway Gate', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (153, 4, 'Windriders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (154, 4, 'Wraithblades', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (155, 4, 'Wraithguard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (156, 4, 'Wraithknight', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (157, 4, 'Wraithlord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (158, 4, 'Yvraine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (159, 4, 'Cobra', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (160, 4, 'Hornet', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (161, 4, 'Irillyth', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (162, 4, 'Lynx', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (163, 4, 'Nightwing', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (164, 4, 'Scorpion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (165, 4, 'Skathach Wraithknight', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (166, 4, 'Shadow Spectres', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (167, 4, 'Phantom Titan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (168, 4, 'Revenant Titan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (169, 4, 'Warp Hunter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (170, 4, 'Wraithseer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (171, 14, 'Callidus Assassin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (172, 14, 'Culexus Assassin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (173, 14, 'Eversor Assassin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (174, 14, 'Exaction Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (175, 14, 'Imperial Navy Breachers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (176, 14, 'Inquisitor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (177, 14, 'Inquisitor Coteaz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (178, 14, 'Inquisitor Eisenhorn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (179, 14, 'Inquisitor Greyfax', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (180, 14, 'Inquisitor Karamazov', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (181, 14, 'Inquisitorial Henchmen', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (182, 14, 'Lord Inquisitor Kyria Draxus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (183, 14, 'Rogue Trader Entourage', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (184, 14, 'Subductor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (185, 14, 'Vigilant Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (186, 14, 'Vindicare Assassin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (187, 14, 'Voidsmen-at-Arms', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (188, 5, 'Aegis Defence Line', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (189, 5, 'Armoured Sentinels', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (190, 5, 'Attilan Rough Riders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (191, 5, 'Baneblade', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (192, 5, 'Banehammer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (193, 5, 'Banesword', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (194, 5, 'Basilisk', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (195, 5, 'Bullgryn Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (196, 5, 'Cadian Castellan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (197, 5, 'Cadian Command Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (198, 5, 'Cadian Shock Troops', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (199, 5, 'Catachan Jungle Fighters', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (200, 5, 'Chimera', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (201, 5, 'Commissar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (202, 5, 'Death Korps of Krieg', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (203, 5, 'Deathstrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (204, 5, 'Doomhammer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (205, 5, 'Field Ordnance Battery', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (206, 5, 'Gauntâ€™s Ghosts', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (207, 5, 'Heavy Weapons Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (208, 5, 'Hellhammer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (209, 5, 'Hellhound', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (210, 5, 'Hydra', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (211, 5, 'Infantry Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (212, 5, 'â€˜Iron Handâ€™ Straken', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (213, 5, 'Kasrkin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (214, 5, 'Leman Russ Battle Tank', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (215, 5, 'Leman Russ Demolisher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (216, 5, 'Leman Russ Eradicator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (217, 5, 'Leman Russ Executioner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (218, 5, 'Leman Russ Exterminator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (219, 5, 'Leman Russ Punisher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (220, 5, 'Leman Russ Vanquisher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (221, 5, 'Lord Solar Leontus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (222, 5, 'Manticore', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (223, 5, 'Militarum Tempestus Command Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (224, 5, 'Munitorum Servitors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (225, 5, 'Nork Deddog', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (226, 5, 'Ogryn Bodyguard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (227, 5, 'Ogryn Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (228, 5, 'Platoon Command Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (229, 5, 'Primaris Psyker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (230, 5, 'Ratling Snipers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (231, 5, 'Regimental AttachÃ©s', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (232, 5, 'Regimental Enginseer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (233, 5, 'Regimental Preacher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (234, 5, 'Rogal Dorn Battle Tank', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (235, 5, 'Scout Sentinels', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (236, 5, 'Sergeant Harker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (237, 5, 'Shadowsword', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (238, 5, 'Sly Marbo', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (239, 5, 'Stormlord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (240, 5, 'Stormsword', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (241, 5, 'Tank Commander', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (242, 5, 'Taurox', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (243, 5, 'Taurox Prime', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (244, 5, 'Tempestus Scions', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (245, 5, 'Ursula Creed', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (246, 5, 'Valkyrie', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (247, 5, 'Wyvern', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (248, 5, 'Avenger Strike Fighter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (249, 5, 'Carnodon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (250, 5, 'Colossus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (251, 5, 'Crassus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (252, 5, 'Cyclops Demolition Vehicle', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (253, 5, 'Death Korps Marshal', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (254, 5, 'Death Rider Squadron', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (255, 5, 'Death Rider Squadron Commander', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (256, 5, 'Earthshaker Carriage Battery', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (257, 5, 'Hades Breaching Drill', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (258, 5, 'Macharius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (259, 5, 'Macharius Vanquisher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (260, 5, 'Macharius Vulcan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (261, 5, 'Malcador', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (262, 5, 'Malcador Annihilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (263, 5, 'Malcador Defender', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (264, 5, 'Malcador Infernus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (265, 5, 'Marauder Bomber', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (266, 5, 'Marauder Destroyer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (267, 5, 'Medusa Carriage Battery', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (268, 5, 'Praetor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (269, 5, 'Rapier Laser Destroyer Battery', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (270, 5, 'Stormblade', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (271, 5, 'Tarantula Battery', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (272, 5, 'Thunderbolt Heavy Fighter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (273, 5, 'Trojan Support Vehicle', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (274, 5, 'Valdor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (275, 5, 'Voss-pattern Lightning', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (276, 5, 'Vulture Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (277, 20, 'Black Templars Gladiator Lancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (278, 20, 'Black Templars Gladiator Reaper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (279, 20, 'Black Templars Gladiator Valiant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (280, 20, 'Black Templars Impulsor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (281, 20, 'Black Templars Repulsor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (282, 20, 'Black Templars Repulsor Executioner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (283, 20, 'Castellan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (284, 20, 'Chaplain Grimaldus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (285, 20, 'Crusader Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (286, 20, 'High Marshal Helbrecht', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (287, 20, 'Marshal', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (288, 20, 'Primaris Crusader Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (289, 20, 'Primaris Sword Brethren', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (290, 20, 'The Emperorâ€™s Champion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (291, 21, 'Astorath', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (292, 21, 'Baal Predator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (293, 21, 'Brother Corbulo', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (294, 21, 'Captain Tycho', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (295, 21, 'Chief Librarian Mephiston', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (296, 21, 'Commander Dante', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (297, 21, 'Death Company Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (298, 21, 'Death Company Intercessors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (299, 21, 'Death Company Marines', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (300, 21, 'Death Company Marines with Jump Packs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (301, 21, 'Furioso Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (302, 21, 'Gabriel Seth', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (303, 21, 'Lemartes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (304, 21, 'Librarian Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (305, 21, 'Sanguinary Guard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (306, 21, 'Sanguinary Priest', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (307, 21, 'Sanguinary Priest with Jump Pack', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (308, 21, 'The Sanguinor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (309, 21, 'Tycho the Lost', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (310, 6, 'Beasts of Nurgle', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (311, 6, 'Beâ€™lakor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (312, 6, 'Bloodcrushers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (313, 6, 'Bloodletters', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (314, 6, 'Bloodmaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (315, 6, 'Bloodthirster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (316, 6, 'Blue Horrors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (317, 6, 'Burning Chariot', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (318, 6, 'Changecaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (319, 6, 'Contorted Epitome', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (320, 6, 'Daemon Prince of Chaos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (321, 6, 'Daemon Prince of Chaos with Wings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (322, 6, 'Daemonettes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (323, 6, 'Epidemius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (324, 6, 'Exalted Flamer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (325, 6, 'Exalted Seeker Chariot', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (326, 6, 'Fateskimmer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (327, 6, 'Feculent Gnarlmaw', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (328, 6, 'Fiends', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (329, 6, 'Flamers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (330, 6, 'Flesh Hounds', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (331, 6, 'Fluxmaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (332, 6, 'Great Unclean One', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (333, 6, 'Hellflayer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (334, 6, 'Horticulous Slimux', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (335, 6, 'Infernal Enrapturess', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (336, 6, 'Kairos Fateweaver', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (337, 6, 'Karanak', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (338, 6, 'Keeper of Secrets', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (339, 6, 'Lord of Change', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (340, 6, 'Nurglings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (341, 6, 'Pink Horrors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (342, 6, 'Plague Drones', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (343, 6, 'Plaguebearers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (344, 6, 'Poxbringer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (345, 6, 'Rendmaster on Blood Throne', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (346, 6, 'Rotigus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (347, 6, 'Screamers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (348, 6, 'Seeker Chariot', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (349, 6, 'Seekers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (350, 6, 'Shalaxi Helbane', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (351, 6, 'Skarbrand', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (352, 6, 'Skull Altar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (353, 6, 'Skull Cannon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (354, 6, 'Skullmaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (355, 6, 'Skulltaker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (356, 6, 'Sloppity Bilepiper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (357, 6, 'Soul Grinder', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (358, 6, 'Spoilpox Scrivener', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (359, 6, 'Syllâ€™esske', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (360, 6, 'The Blue Scribes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (361, 6, 'The Changeling', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (362, 6, 'The Masque of Slaanesh', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (363, 6, 'Tormentbringer on Exalted Seeker Chariot', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (364, 6, 'Tranceweaver', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (365, 7, 'Knight Abominant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (366, 7, 'Knight Desecrator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (367, 7, 'Knight Despoiler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (368, 7, 'Knight Rampager', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (369, 7, 'Knight Tyrant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (370, 7, 'War Dog Brigand', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (371, 7, 'War Dog Executioner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (372, 7, 'War Dog Huntsman', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (373, 7, 'War Dog Karnivore', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (374, 7, 'War Dog Stalker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (375, 7, 'Chaos Acastus Knight Asterius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (376, 7, 'Chaos Acastus Knight Porphyrion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (377, 7, 'Chaos Cerastus Knight Acheron', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (378, 7, 'Chaos Cerastus Knight Atrapos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (379, 7, 'Chaos Cerastus Knight Castigator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (380, 7, 'Chaos Cerastus Knight Lancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (381, 7, 'Chaos Questoris Knight Magaera', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (382, 7, 'Chaos Questoris Knight Styrix', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (383, 7, 'War Dog Moirax', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (384, 8, 'Abaddon the Despoiler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (385, 8, 'Accursed Cultists', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (386, 8, 'Chaos Bikers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (387, 8, 'Chaos Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (388, 8, 'Chaos Lord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (389, 8, 'Chaos Lord in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (390, 8, 'Chaos Predator Annihilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (391, 8, 'Chaos Predator Destructor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (392, 8, 'Chaos Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (393, 8, 'Chaos Spawn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (394, 8, 'Chaos Terminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (395, 8, 'Chaos Vindicator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (396, 8, 'Chosen', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (397, 8, 'Cultist Mob', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (398, 8, 'Cypher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (399, 8, 'Dark Apostle', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (400, 8, 'Dark Commune', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (401, 8, 'Defiler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (402, 8, 'Exalted Champion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (403, 8, 'Fabius Bile', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (404, 8, 'Fellgor Beastmen', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (405, 8, 'Forgefiend', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (406, 8, 'Haarken Worldclaimer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (407, 8, 'Havocs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (408, 8, 'Helbrute', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (409, 8, 'Heldrake', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (410, 8, 'Heretic Astartes Daemon Prince', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (411, 8, 'Heretic Astartes Daemon Prince with Wings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (412, 8, 'Huron Blackheart', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (413, 8, 'Khorne Lord of Skulls', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (414, 8, 'Legionaries', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (415, 8, 'Lord Discordant on Helstalker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (416, 8, 'Lucius the Eternal', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (417, 8, 'Master of Executions', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (418, 8, 'Master of Possession', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (419, 8, 'Maulerfiend', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (420, 8, 'Noctilith Crown', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (421, 8, 'Noise Marines', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (422, 8, 'Obliterators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (423, 8, 'Possessed', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (424, 8, 'Raptors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (425, 8, 'Sorcerer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (426, 8, 'Sorcerer in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (427, 8, 'Traitor Enforcer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (428, 8, 'Traitor Guardsmen Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (429, 8, 'Vashtorr the Arkifane', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (430, 8, 'Venomcrawler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (431, 8, 'Warp Talons', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (432, 8, 'Warpsmith', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (433, 22, 'Asmodai', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (434, 22, 'Azrael', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (435, 22, 'Belial', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (436, 22, 'Deathwing Command Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (437, 22, 'Deathwing Knights', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (438, 22, 'Deathwing Strikemaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (439, 22, 'Deathwing Terminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (440, 22, 'Ezekiel', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (441, 22, 'Lazarus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (442, 22, 'Lion Elâ€™Jonson', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (443, 22, 'Nephilim Jetfighter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (444, 22, 'Ravenwing Black Knights', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (445, 22, 'Ravenwing Command Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (446, 22, 'Ravenwing Dark Talon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (447, 22, 'Ravenwing Darkshroud', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (448, 22, 'Ravenwing Land Speeder Vengeance', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (449, 22, 'Ravenwing Talonmaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (450, 22, 'Sammael', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (451, 10, 'Biologus Putrifier', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (452, 10, 'Blightlord Terminators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (453, 10, 'Death Guard Chaos Lord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (454, 10, 'Death Guard Chaos Lord in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (455, 10, 'Death Guard Chaos Spawn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (456, 10, 'Death Guard Cultists', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (457, 10, 'Death Guard Daemon Prince', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (458, 10, 'Death Guard Daemon Prince with Wings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (459, 10, 'Death Guard Defiler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (460, 10, 'Death Guard Helbrute', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (461, 10, 'Death Guard Icon Bearer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (462, 10, 'Death Guard Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (463, 10, 'Death Guard Predator Annihilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (464, 10, 'Death Guard Predator Destructor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (465, 10, 'Death Guard Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (466, 10, 'Death Guard Sorcerer in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (467, 10, 'Deathshroud Terminators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (468, 10, 'Foetid Bloat-drone', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (469, 10, 'Foul Blightspawn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (470, 10, 'Lord of Contagion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (471, 10, 'Lord of Virulence', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (472, 10, 'Malignant Plaguecaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (473, 10, 'Miasmic Malignifier', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (474, 10, 'Mortarion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (475, 10, 'Myphitic Blight-haulers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (476, 10, 'Noxious Blightbringer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (477, 10, 'Plague Marines', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (478, 10, 'Plague Surgeon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (479, 10, 'Plagueburst Crawler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (480, 10, 'Poxwalkers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (481, 10, 'Tallyman', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (482, 10, 'Typhus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (483, 23, 'Corvus Blackstar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (484, 23, 'Deathwatch Terminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (485, 23, 'Deathwatch Veterans', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (486, 23, 'Fortis Kill Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (487, 23, 'Indomitor Kill Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (488, 23, 'Kill Team Cassius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (489, 23, 'Proteus Kill Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (490, 23, 'Spectrus Kill Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (491, 23, 'Veteran Bike Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (492, 23, 'Watch Captain Artemis', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (493, 23, 'Watch Master', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (494, 11, 'Archon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (495, 11, 'Beastmaster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (496, 11, 'Court of the Archon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (497, 11, 'Cronos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (498, 11, 'Drazhar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (499, 11, 'Grotesques', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (500, 11, 'Haemonculus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (501, 11, 'Hellions', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (502, 11, 'Incubi', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (503, 11, 'Kabalite Warriors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (504, 11, 'Lelith Hesperax', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (505, 11, 'Mandrakes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (506, 11, 'Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (507, 11, 'Ravager', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (508, 11, 'Razorwing Jetfighter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (509, 11, 'Reavers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (510, 11, 'Scourges', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (511, 11, 'Succubus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (512, 11, 'Talos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (513, 11, 'Urien Rakarth', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (514, 11, 'Venom', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (515, 11, 'Voidraven Bomber', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (516, 11, 'Wracks', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (517, 11, 'Wyches', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (518, 11, 'Tantalus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (519, 12, 'Aberrants', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (520, 12, 'Abominant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (521, 12, 'Achilles Ridgerunners', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (522, 12, 'Acolyte Hybrids', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (523, 12, 'Acolyte Iconward', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (524, 12, 'Atalan Jackals', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (525, 12, 'Biophagus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (526, 12, 'Clamavus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (527, 12, 'Goliath Rockgrinder', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (528, 12, 'Goliath Truck', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (529, 12, 'Hybrid Metamorphs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (530, 12, 'Jackal Alphus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (531, 12, 'Kelermorph', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (532, 12, 'Locus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (533, 12, 'Magus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (534, 12, 'Neophyte Hybrids', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (535, 12, 'Nexos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (536, 12, 'Patriarch', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (537, 12, 'Primus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (538, 12, 'Purestrain Genestealers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (539, 12, 'Reductus Saboteur', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (540, 12, 'Sanctus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (541, 13, 'Brother-Captain', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (542, 13, 'Brother-Captain Stern', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (543, 13, 'Brotherhood Champion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (544, 13, 'Brotherhood Chaplain', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (545, 13, 'Brotherhood Librarian', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (546, 13, 'Brotherhood Terminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (547, 13, 'Castellan Crowe', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (548, 13, 'Grand Master', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (549, 13, 'Grand Master in Nemesis Dreadknight', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (550, 13, 'Grand Master Voldus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (551, 13, 'Grey Knights Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (552, 13, 'Grey Knights Land Raider Crusader', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (553, 13, 'Grey Knights Land Raider Redeemer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (554, 13, 'Grey Knights Razorback', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (555, 13, 'Grey Knights Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (556, 13, 'Grey Knights Stormhawk Interceptor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (557, 13, 'Grey Knights Stormraven Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (558, 13, 'Grey Knights Stormtalon Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (559, 13, 'Grey Knights Venerable Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (560, 13, 'Interceptor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (561, 13, 'Kaldor Draigo', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (562, 13, 'Nemesis Dreadknight', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (563, 13, 'Paladin Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (564, 13, 'Purgation Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (565, 13, 'Purifier Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (566, 13, 'Servitors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (567, 13, 'Strike Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (568, 13, 'Grey Knights Thunderhawk Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (569, 13, 'Land Raider Banisher', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (570, 15, 'Armiger Helverin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (571, 15, 'Armiger Warglaive', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (572, 15, 'Canis Rex', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (573, 15, 'Knight Castellan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (574, 15, 'Knight Crusader', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (575, 15, 'Knight Errant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (576, 15, 'Knight Gallant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (577, 15, 'Knight Paladin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (578, 15, 'Knight Preceptor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (579, 15, 'Knight Valiant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (580, 15, 'Knight Warden', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (581, 15, 'Acastus Knight Asterius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (582, 15, 'Acastus Knight Porphyrion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (583, 15, 'Armiger Moirax', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (584, 15, 'Cerastus Knight Acheron', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (585, 15, 'Cerastus Knight Atrapos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (586, 15, 'Cerastus Knight Castigator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (587, 15, 'Cerastus Knight Lancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (588, 15, 'Questoris Knight Magaera', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (589, 15, 'Questoris Knight Styrix', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (590, 16, 'BrÃ´khyr Iron-master', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (591, 16, 'BrÃ´khyr Thunderkyn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (592, 16, 'Cthonian Beserks', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (593, 16, 'Einhyr Champion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (594, 16, 'Einhyr Hearthguard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (595, 16, 'Grimnyr', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (596, 16, 'Hearthkyn Warriors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (597, 16, 'Hekaton Land Fortress', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (598, 16, 'Hernkyn Pioneers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (599, 16, 'KÃ¢hl', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (600, 16, 'Sagitaur', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (601, 16, 'Ã›thar the Destined', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (602, 17, 'Annihilation Barge', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (603, 17, 'Câ€™tan Shard of the Deceiver', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (604, 17, 'Câ€™tan Shard of the Nightbringer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (605, 17, 'Câ€™tan Shard of the Void Dragon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (606, 17, 'Canoptek Doomstalker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (607, 17, 'Canoptek Reanimator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (608, 17, 'Canoptek Scarab Swarms', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (609, 17, 'Canoptek Spyders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (610, 17, 'Canoptek Wraiths', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (611, 17, 'Catacomb Command Barge', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (612, 17, 'Chronomancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (613, 17, 'Convergence of Dominion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (614, 17, 'Cryptothralls', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (615, 17, 'Deathmarks', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (616, 17, 'Doom Scythe', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (617, 17, 'Doomsday Ark', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (618, 17, 'Flayed Ones', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (619, 17, 'Ghost Ark', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (620, 17, 'Hexmark Destroyer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (621, 17, 'Illuminor Szeras', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (622, 17, 'Immortals', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (623, 17, 'Imotekh the Stormlord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (624, 17, 'Lokhust Destroyers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (625, 17, 'Lokhust Heavy Destroyers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (626, 17, 'Lokhust Lord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (627, 17, 'Lychguard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (628, 17, 'Monolith', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (629, 17, 'Necron Warriors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (630, 17, 'Night Scythe', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (631, 17, 'Obelisk', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (632, 17, 'Ophydian Destroyers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (633, 17, 'Orikan the Diviner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (634, 17, 'Overlord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (635, 17, 'Overlord with Translocation Shroud', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (636, 17, 'Plasmancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (637, 17, 'Psychomancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (638, 17, 'Royal Warden', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (639, 17, 'Skorpekh Destroyers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (640, 17, 'Skorpekh Lord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (641, 17, 'Technomancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (642, 17, 'Tesseract Vault', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (643, 17, 'The Silent King', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (644, 17, 'Tomb Blades', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (645, 17, 'Transcendent Câ€™tan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (646, 17, 'Trazyn the Infinite', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (647, 17, 'Triarch Praetorians', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (648, 17, 'Triarch Stalker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (649, 17, 'Canoptek Acanthrites', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (650, 17, 'Canoptek Tomb Sentinel', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (651, 17, 'Canoptek Tomb Stalker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (652, 17, 'Seraptek Heavy Construct', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (653, 17, 'Tesseract Ark', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (654, 18, 'Battlewagon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (655, 18, 'Beast Snagga Boyz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (656, 18, 'Beastboss', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (657, 18, 'Beastboss on Squigosaur', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (658, 18, 'Big Mek in Mega Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (659, 18, 'Big Mek with Kustom Force Field', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (660, 18, 'Big Mek with Shokk Attack Gun', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (661, 18, 'Bigâ€™ed Bossbunka', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (662, 18, 'Blitza-bommer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (663, 18, 'Boomdakka Snazzwagon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (664, 18, 'Boss Snikrot', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (665, 18, 'Boss Zagstruk', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (666, 18, 'Boyz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (667, 18, 'Burna Boyz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (668, 18, 'Burna-bommer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (669, 18, 'Dakkajet', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (670, 18, 'Deff Dread', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (671, 18, 'Deffkilla Wartrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (672, 18, 'Deffkoptas', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (673, 18, 'Flash Gitz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (674, 18, 'Ghazghkull Thraka', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (675, 18, 'Gorkanaut', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (676, 18, 'Gretchin', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (677, 18, 'Hunta Rig', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (678, 18, 'Kaptin Badrukk', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (679, 18, 'Kill Rig', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (680, 18, 'Killa Kans', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (681, 18, 'Kommandos', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (682, 18, 'Kustom Boosta-blasta', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (683, 18, 'Lootas', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (684, 18, 'Mad Dok Grotsnik', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (685, 18, 'Meganobz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (686, 18, 'Megatrakk Scrapjet', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (687, 18, 'Mek', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (688, 18, 'Mek Gunz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (689, 18, 'Mekboy Workshop', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (690, 18, 'Morkanaut', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (691, 18, 'Mozrog Skragbad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (692, 18, 'Nob on Smasha Squig', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (693, 18, 'Nob with Waaagh! Banner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (694, 18, 'Nobz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (695, 18, 'Painboss', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (696, 18, 'Painboy', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (697, 18, 'Rukkatrukk Squigbuggy', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (698, 18, 'Shokkjump Dragsta', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (699, 18, 'Squighog Boyz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (700, 18, 'Stompa', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (701, 18, 'Stormboyz', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (702, 18, 'Tankbustas', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (703, 18, 'Trukk', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (704, 18, 'Warbikers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (705, 18, 'Warboss', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (706, 18, 'Warboss in Mega Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (707, 18, 'Wazbom Blastajet', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (708, 18, 'Weirdboy', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (709, 18, 'Wurrboy', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (710, 18, 'Zodgrod Wortsnagga', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (711, 18, 'Big Trakk', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (712, 18, 'Grot Mega-tank', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (713, 18, 'Grot Tanks', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (714, 18, 'Gargantuan Squiggoth', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (715, 18, 'Kill Tank', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (716, 18, 'Mega Dread', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (717, 18, 'Meka-dread', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (718, 18, 'Nobz on Warbikes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (719, 18, 'Squiggoth', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (720, 18, 'Warboss on Warbike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (721, 27, 'Adrax Agatone', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (722, 29, 'Captain Sicarius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (723, 29, 'Chief Librarian Tigurius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (724, 24, 'Darnath Lysander', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (725, 25, 'Iron Father Feirros', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (726, 26, 'Kayvaan Shrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (727, 30, 'Korâ€™sarro Khan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (728, 29, 'Marneus Calgar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (729, 24, 'Pedro Kantor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (730, 29, 'Roboute Guilliman', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (731, 24, 'Tor Garadon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (732, 29, 'Uriel Ventris', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (733, 27, 'Vulkan Heâ€™stan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (734, 19, 'Aggressor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (735, 19, 'Ancient', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (736, 19, 'Ancient in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (737, 19, 'Apothecary', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (738, 19, 'Apothecary Biologis', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (739, 19, 'Assault Intercessor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (740, 19, 'Assault Intercessors with Jump Packs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (741, 19, 'Ballistus Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (742, 19, 'Bladeguard Ancient', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (743, 19, 'Bladeguard Veteran Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (744, 19, 'Brutalis Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (745, 19, 'Captain', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (746, 19, 'Captain in Gravis Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (747, 19, 'Captain in Phobos Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (748, 19, 'Captain in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (749, 19, 'Captain with Jump Pack', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (750, 19, 'Centurion Assault Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (751, 19, 'Centurion Devastator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (752, 19, 'Chaplain', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (753, 19, 'Chaplain in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (754, 19, 'Chaplain on Bike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (755, 19, 'Chaplain with Jump Pack', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (756, 19, 'Company Heroes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (757, 19, 'Desolation Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (758, 19, 'Devastator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (759, 19, 'Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (760, 19, 'Drop Pod', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (761, 19, 'Eliminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (762, 19, 'Eradicator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (763, 19, 'Firestrike Servo-turrets', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (764, 19, 'Gladiator Lancer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (765, 19, 'Gladiator Reaper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (766, 19, 'Gladiator Valiant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (767, 19, 'Hammerfall Bunker', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (768, 19, 'Heavy Intercessor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (769, 19, 'Hellblaster Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (770, 19, 'Impulsor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (771, 19, 'Inceptor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (772, 19, 'Incursor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (773, 19, 'Infernus Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (774, 19, 'Infiltrator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (775, 19, 'Intercessor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (776, 19, 'Invader ATV', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (777, 19, 'Invictor Tactical Warsuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (778, 19, 'Judiciar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (779, 19, 'Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (780, 19, 'Land Raider Crusader', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (781, 19, 'Land Raider Redeemer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (782, 19, 'Librarian', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (783, 19, 'Librarian in Phobos Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (784, 19, 'Librarian in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (785, 19, 'Lieutenant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (786, 19, 'Lieutenant in Phobos Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (787, 19, 'Lieutenant in Reiver Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (788, 19, 'Lieutenant with Combi-weapon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (789, 19, 'Outrider Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (790, 19, 'Predator Annihilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (791, 19, 'Predator Destructor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (792, 19, 'Razorback', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (793, 19, 'Redemptor Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (794, 19, 'Reiver Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (795, 19, 'Repulsor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (796, 19, 'Repulsor Executioner', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (797, 19, 'Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (798, 19, 'Scout Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (799, 19, 'Sternguard Veteran Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (800, 19, 'Storm Speeder Hailstrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (801, 19, 'Storm Speeder Hammerstrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (802, 19, 'Storm Speeder Thunderstrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (803, 19, 'Stormhawk Interceptor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (804, 19, 'Stormraven Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (805, 19, 'Stormtalon Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (806, 19, 'Suppressor Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (807, 19, 'Tactical Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (808, 19, 'Techmarine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (809, 19, 'Terminator Assault Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (810, 19, 'Terminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (811, 19, 'Vanguard Veteran Squad with Jump Packs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (812, 19, 'Vindicator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (813, 19, 'Whirlwind', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (814, 19, 'Astraeus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (815, 19, 'Thunderhawk Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (816, 28, 'Arjac Rockfist', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (817, 28, 'Bjorn the Fell-Handed', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (818, 28, 'Blood Claws', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (819, 28, 'Canis Wolfborn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (820, 28, 'Cyberwolf', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (821, 28, 'Fenrisian Wolves', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (822, 28, 'Grey Hunters', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (823, 28, 'Harald Deathwolf', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (824, 28, 'Hounds of Morkai', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (825, 28, 'Iron Priest', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (826, 28, 'Krom Dragongaze', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (827, 28, 'Logan Grimnar', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (828, 28, 'Logan Grimnar on Stormrider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (829, 28, 'Long Fangs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (830, 28, 'Lukas the Trickster', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (831, 28, 'Murderfang', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (832, 28, 'Njal Stormcaller', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (833, 28, 'Ragnar Blackmane', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (834, 28, 'Skyclaws', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (835, 28, 'Space Wolves Venerable Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (836, 28, 'Stormfang Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (837, 28, 'Stormwolf', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (838, 28, 'Thunderwolf Cavalry', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (839, 28, 'Ulrik the Slayer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (840, 28, 'Wolf Guard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (841, 28, 'Wolf Guard Battle Leader in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (842, 28, 'Wolf Guard Battle Leader on Thunderwolf', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (843, 28, 'Wolf Guard Pack Leader', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (844, 28, 'Wolf Guard Pack Leader in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (845, 28, 'Wolf Guard Pack Leader with Jump Pack', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (846, 28, 'Wolf Guard Terminators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (847, 28, 'Wolf Lord on Thunderwolf', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (848, 28, 'Wolf Scouts', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (849, 28, 'Wulfen', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (850, 28, 'Wulfen Dreadnought', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (851, 34, 'Aunâ€™Shi', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (852, 34, 'Aunâ€™Va', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (853, 34, 'Breacher Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (854, 34, 'Broadside Battlesuits', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (855, 34, 'Cadre Fireblade', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (856, 34, 'Commander Farsight', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (857, 34, 'Commander in Coldstar Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (858, 34, 'Commander in Crisis Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (859, 34, 'Commander in Enforcer Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (860, 34, 'Commander Shadowsun', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (861, 34, 'Crisis Battlesuits', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (862, 34, 'Darkstrider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (863, 34, 'Devilfish', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (864, 34, 'Ethereal', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (865, 34, 'Firesight Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (866, 34, 'Ghostkeel Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (867, 34, 'Hammerhead Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (868, 34, 'Kroot Carnivores', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (869, 34, 'Kroot Farstalkers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (870, 34, 'Kroot Hounds', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (871, 34, 'Kroot Shaper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (872, 34, 'Krootox Riders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (873, 34, 'Longstrike', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (874, 34, 'Pathfinder Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (875, 34, 'Piranhas', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (876, 34, 'Razorshark Strike Fighter', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (877, 34, 'Riptide Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (878, 34, 'Sky Ray Gunship', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (879, 34, 'Stealth Battlesuits', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (880, 34, 'Stormsurge', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (881, 34, 'Strike Team', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (882, 34, 'Sun Shark Bomber', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (883, 34, 'Tactical Drones', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (884, 34, 'Tidewall Droneport', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (885, 34, 'Tidewall Gunrig', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (886, 34, 'Tidewall Shieldline', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (887, 34, 'Vespid Stingwings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (888, 34, 'AX-1-0 Tiger Shark', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (889, 34, 'Barracuda', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (890, 34, 'Manta', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (891, 34, 'Remora Stealth Drones', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (892, 34, 'Râ€™varna Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (893, 34, 'Taâ€™unar Supremacy Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (894, 34, 'Tetras', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (895, 34, 'Tiger Shark', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (896, 34, 'Yâ€™vahra Battlesuit', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (897, 31, 'Ahriman', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (898, 31, 'Ahriman on Disc of Tzeentch', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (899, 31, 'Exalted Sorcerer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (900, 31, 'Exalted Sorcerer on Disc of Tzeentch', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (901, 31, 'Infernal Master', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (902, 31, 'Magnus the Red', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (903, 31, 'Mutalith Vortex Beast', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (904, 31, 'Rubric Marines', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (905, 31, 'Scarab Occult Terminators', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (906, 31, 'Thousand Sons Chaos Spawn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (907, 31, 'Thousand Sons Cultists', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (908, 31, 'Thousand Sons Daemon Prince', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (909, 31, 'Thousand Sons Daemon Prince with Wings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (910, 31, 'Thousand Sons Defiler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (911, 31, 'Thousand Sons Forgefiend', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (912, 31, 'Thousand Sons Helbrute', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (913, 31, 'Thousand Sons Heldrake', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (914, 31, 'Thousand Sons Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (915, 31, 'Thousand Sons Maulerfiend', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (916, 31, 'Thousand Sons Predator Annihilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (917, 31, 'Thousand Sons Predator Destructor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (918, 31, 'Thousand Sons Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (919, 31, 'Thousand Sons Sorcerer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (920, 31, 'Thousand Sons Sorcerer in Terminator Armour', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (921, 31, 'Thousand Sons Vindicator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (922, 31, 'Tzaangor Enlightened', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (923, 31, 'Tzaangor Shaman', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (924, 31, 'Tzaangors', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (925, 33, 'Barbgaunts', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (926, 33, 'Biovores', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (927, 33, 'Broodlord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (928, 33, 'Carnifexes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (929, 33, 'Deathleaper', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (930, 33, 'Exocrine', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (931, 33, 'Gargoyles', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (932, 33, 'Genestealers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (933, 33, 'Harpy', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (934, 33, 'Haruspex', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (935, 33, 'Hive Crone', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (936, 33, 'Hive Guard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (937, 33, 'Hive Tyrant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (938, 33, 'Hormagaunts', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (939, 33, 'Lictor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (940, 33, 'Maleceptor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (941, 33, 'Mawloc', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (942, 33, 'Mucolid Spores', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (943, 33, 'Neurogaunts', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (944, 33, 'Neurolictor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (945, 33, 'Neurotyrant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (946, 33, 'Norn Assimilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (947, 33, 'Norn Emissary', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (948, 33, 'Old One Eye', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (949, 33, 'Parasite of Mortrex', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (950, 33, 'Psychophage', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (951, 33, 'Pyrovores', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (952, 33, 'Raveners', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (953, 33, 'Ripper Swarms', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (954, 33, 'Screamer-Killer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (955, 33, 'Spore MInes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (956, 33, 'Sporocyst', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (957, 33, 'Termagants', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (958, 33, 'Tervigon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (959, 33, 'The Swarmlord', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (960, 33, 'Toxicrene', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (961, 33, 'Trygon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (962, 33, 'Tyranid Warriors with Melee Bio-weapons', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (963, 33, 'Tyranid Warriors with Ranged Bio-weapons', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (964, 33, 'Tyrannocyte', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (965, 33, 'Tyrannofex', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (966, 33, 'Tyrant Guard', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (967, 33, 'Venomthropes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (968, 33, 'Von Ryanâ€™s Leapers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (969, 33, 'Winged Hive Tyrant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (970, 33, 'Winged Tyranid Prime', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (971, 33, 'Zoanthropes', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (972, 33, 'Barbed Hierodule', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (973, 33, 'Harridan', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (974, 33, 'Hierophant', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (975, 33, 'Scythed Hierodule', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (976, 35, 'Angron', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (977, 35, 'Eightbound', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (978, 35, 'Exalted Eightbound', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (979, 35, 'Jakhals', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (980, 35, 'Khorne Berzerkers', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (981, 35, 'Khorne Lord of Skulls', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (982, 35, 'KhÃ¢rn the Betrayer', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (983, 35, 'Lord Invocatus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (984, 35, 'World Eaters Chaos Spawn', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (985, 35, 'World Eaters Daemon Prince', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (986, 35, 'World Eaters Daemon Prince with Wings', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (987, 35, 'World Eaters Defiler', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (988, 35, 'World Eaters Forgefiend', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (989, 35, 'World Eaters Helbrute', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (990, 35, 'World Eaters Heldrake', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (991, 35, 'World Eaters Land Raider', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (992, 35, 'World Eaters Lord on Juggernaut', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (993, 35, 'World Eaters Master of Executions', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (994, 35, 'World Eaters Maulerfiend', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (995, 35, 'World Eaters Predator Annihilator', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (996, 35, 'World Eaters Predator Destructor', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (997, 35, 'World Eaters Rhino', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (998, 35, 'World Eaters Terminator Squad', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_unit` (`id`, `faction_id`, `name`, `edition`) VALUES (999, 29, 'Victrix Honour Guard', '10');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`datasheet`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (1, 1, 19, 745, 1, 6, 4, 3, 5, 6, 1, '1/1,2/1,3,4/1,5/1,5/2,', '6,7,8,', 1, 1, 1, '1,2,3,4,5,6,7,', 'Adeptus Astartes', 4, 80, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (2, 1, 19, 746, 1, 6, 6, 3, 6, 6, 1, '9/1,10,', '7,8,11/3,12/3,13/3,', 1, 1, 1, '1,2,3,4,7,8,', 'Adeptus Astartes', 4, 80, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (3, 1, 19, 747, 1, 6, 4, 3, 5, 6, 1, '1/1,14/4,', '15,', 1, 1, 1, '1,2,3,4,7,9,', 'Adeptus Astartes', 4, 80, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (4, 1, 19, 748, 1, 5, 5, 2, 6, 6, 1, '16/5/4,16/6,16/7/1,17/7/2,', '8,18/8/3,20/6,21/9,', 1, 1, 1, '1,2,4,7,10,', 'Adeptus Astartes', 4, 95, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (5, 1, 19, 749, 1, 12, 4, 3, 5, 6, 1, '1/1,22/8/2,22/1,23/10,4/1,5/1,5/2,23/10,23/1,23/11,24/1,24/12/2,25', '6,8,19,20/6,21/9,28,', 1, 1, 1, '1,2,3,4,7,11,12', 'Adeptus Astartes', 4, 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (6, 1, 19, 785, 1, 6, 4, 3, 4, 6, 1, '1/1,2/1,3,4/1,5/1,5/2,29/6,29/1,', '30,31,32,', 1, 1, 1, '1,2,3,4,5,', 'Adeptus Astartes','', 65, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (7, 1, 19, 787, 1, 6, 4, 3, 4, 6, 1, '33/1,33/4,', '15/4,', 1, 1, 1, '1,2,3,4,9,13,', 'Adeptus Astartes','', 55, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (8, 1, 19, 786, 1, 6, 4, 3, 4, 6, 1, '1/1,34,', '35/13/1,', 1, 1, 1, '1,2,3,4,9,', 'Adeptus Astartes','', 55, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (9, 1, 19, 782, 1, 6, 4, 3, 4, 6, 1, '36/1,37/14,38/6,38/2,38/14,', '39/14,', 1, 1, 1, '1,2,3,4,5,14,', 'Adeptus Astartes','', 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (10, 1, 19, 783, 1, 6, 4, 3, 4, 6, 1, '36/1,37/14,38/6,38/2,38/14,', '39/14,', 1, 1, 1, '1,2,3,4,9,14,15,', 'Adeptus Astartes','', 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (11, 1, 19, 784, 1, 5, 5, 2, 5, 6, 1, '37/14,38/6,38/2,38/14,40/5/4,40/6,40/7/1,41/7/2,', '39/14,', 1, 1, 1, '1,2,4,14,15,16,', 'Adeptus Astartes', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (12, 1, 19, 752, 1, 6, 4, 3, 4, 5, 1, '42/1,', '43,', 1, 1, 1, '1,2,3,4,5,', 'Adeptus Astartes', 4, 60, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (13, 1, 19, 753, 1, 5, 5, 2, 5, 5, 1, '40/5/4,40/6,40/7/1,41/7/2,', '43,', 1, 1, 1, '1,2,4,16,17,', 'Adeptus Astartes', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (14, 1, 19, 754, 1, 12, 5, 3, 5, 5, 1, '42/1,44/9,', '43,', 1, 1, 1, '2,3,4,17,18,', 'Adeptus Astartes', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (15, 1, 19, 755, 1, 12, 4, 3, 4, 6, 1, '23/10,23/1,23/11,36/1,40/5/4,40/6,40/7/1,41/7/2,45,46/8/2,46/1,47/1,48/2,48/1,', '32,43,', 1, 1, 1, '1,2,4,11,12,17,', 'Adeptus Astartes', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (16, 1, 19, 808, 1, 6, 4, 2, 4, 6, 1, '49,50/8/2/,50/1,', '51,52/3,', 1, 1, 1, '1,2,3,4,5,', 'Adeptus Astartes','', 55, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (17, 1, 19, 775, 2, 6, 4, 3, 2, 6, 2, '23/10,23/1,23/11,36/1,47/1,48/2,48/1,53/15,54,55/16,55/17,', '56,57,58,59,60/6,', 5, 5, 10, '1,3,4,5,19,', 'Adeptus Astartes','', 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (18, 1, 19, 773, 2, 6, 4, 3, 2, 6, 1, '36/1,61/10,61/11,', '57,', 5, 5, 10, '1,3,4,5,', 'Adeptus Astartes','', 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (19, 1, 19, 740, 2, 6, 4, 3, 2, 6, 2, '23/10,23/1,23/11,47/1,48/2,48/1,62/1,', '58,59,60/6,63,', 5, 5, 10, '1,3,4,5,', 'Adeptus Astartes','', 80, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (20, 1, 19, 788, 1, 6, 4, 3, 4, 6, 1, '16/5/4,16/6,16/7/1,', '64/18/4,64/13/1,', 1, 1, 1, '1,2,3,4,9,13,', 'Adeptus Astartes','', 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (21, 1, 19, 768, 2, 5, 6, 3, 3, 6, 2, '36/1,65/16,65/17,66/16,66/17,66/13/1,', '57,', 5, 5, 10, '1,3,4,8,19,', 'Adeptus Astartes','', 105, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (22, 1, 19, 774, 4, 6, 4, 3, 2, 6, 1, '36/1,66/16,66/17,66/13/1,67/17,', '57,', 5, 5, 10, '1,3,4,9,13,', 'Adeptus Astartes','', 100, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (23, 1, 19, 772, 4, 6, 4, 3, 2, 6, 1, '36/1,68/10,68/16,', '69/13/1,', 5, 5, 10, '1,3,4,9,13,', 'Adeptus Astartes','', 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (24, 1, 19, 807, 2, 6, 4, 3, 2, 6, 2, '36/1,45,70/10,70/11,71/8/2,72/12/2,73/7/1,74/2,74/7/1,', '63,75,76,77,78/6,79/9,', 10, 1, 10, '1,3,4,19,', 'Adeptus Astartes','', 160, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (25, 1, 19, 798, 4, 6, 4, 4, 2, 6, 1, '80/16,36/1,45,66/17,66/13/1,81/15,81/17,82/17,', '63,75,77,78/6,83,84', 5, 5, 10, '1,3,4,13,', 'Adeptus Astartes','', 55, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (26, 1, 19, 737, 1, 6, 4, 3, 4, 6, 1, '42/1,85/1,', '86,', 1, 1, 1, '1,2,3,4,5,', 'Adeptus Astartes','', 50, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (27, 1, 19, 738, 1, 5, 6, 3, 5, 6, 3, '42/1,', '86,', 1, 1, 1, '1,2,4,8,20,', 'Adeptus Astartes','', 55, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (28, 1, 19, 735, 1, 6, 4, 3, 4, 6, 1, '36/1,55/16,55/17,', '30,87,', 1, 1, 1, '1,2,3,4,5,20,', 'Adeptus Astartes','', 50, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (29, 1, 19, 742, 1, 6, 4, 3, 4, 6, 1, '62/1,', '30,', 1, 1, 1, '1,2,3,4,5,', 'Adeptus Astartes', 4, 45, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (30, 1, 19, 736, 1, 5, 5, 2, 5, 6, 1, '41/7/2,', '88/8/3,30,32,87,89/6,90/9,', 1, 1, 1, '1,2,4,10,', 'Adeptus Astartes', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (31, 1, 19, 743, 4, 6, 4, 3, 3, 6, 1, '62/1,91/6,91/1,47/1,48/2,48/1,', '92,', 3, 3, 6, '1,3,4,5,', 'Adeptus Astartes', 4, 90, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (32, 1, 19, 811, 4, 12, 4, 3, 2, 6, 1, '36/1,46/8/2,46/1,23/10,23/1,23/11,93/12/2,93/1,47/1,48/2,48/1,', '94,', 5, 5, 10, '1,3,4,11,12,', 'Adeptus Astartes','', 105, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (33, 1, 19, 799, 4, 6, 4, 3, 2, 6, 1, '40/5/4,40/6,40/7/1,95/6,95/1,96/16,96/6,96/17,96/7/1,97/6,97/17,97/13/1,', '86,', 5, 5, 10, '1,3,4,5,', 'Adeptus Astartes','', 100, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (34, 1, 19, 778, 1, 6, 4, 3, 4, 5, 1, '42/1,', '98/6,98/4,', 1, 1, 1, '1,2,4,5,', 'Adeptus Astartes', 4, 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (35, 1, 19, 794, 4, 6, 4, 3, 2, 6, 1, '99/4,100/1,100/4,', '57,101/4,', 5, 5, 10, '1,2,4,9,13,', 'Adeptus Astartes','', 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (36, 1, 19, 734, 4, 5, 6, 3, 3, 6, 1, '102/9,103/10,103/11,103/9,104/15,', '105/9,', 3, 3, 6, '1,4,8,', 'Adeptus Astartes','', 110, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (37, 1, 19, 809, 4, 5, 5, 2, 3, 6, 1, '', '60/6,106/9,', 5, 5, 10, '1,4,16,', 'Adeptus Astartes', 4, 195, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (38, 1, 19, 810, 4, 5, 5, 2, 3, 6, 1, '107/6,108/15,109,110/10,110/11,41/7/2,', '111/8/3,58,59', 5, 5, 10, '1,4,16,', 'Adeptus Astartes', 4, 185, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (39, 1, 19, 750, 4, 4, 7, 2, 4, 6, 2, '112/7/3,112/9,113/10,113/11,113/9,114/12/2,114/9,', '115/9,', 3, 3, 6, '1,4,21,', 'Adeptus Astartes','', 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (40, 1, 19, 751, 4, 4, 7, 2, 4, 6, 2, '112/7/3,112/9,116/15,117/8/2,118/13/1,118/9,119/9,', '120,', 3, 3, 6, '1,4,21,', 'Adeptus Astartes','', 175, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (41, 1, 19, 777, 4, 8, 8, 3, 12, 6, 4, '104/15,118/13/1,121/10,121/11,122/9,123/7/3,123/9', '124,', 1, 1, 1, '4,9,22,23,', 'Adeptus Astartes','', 140, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (42, 1, 19, 759, 4, 6, 9, 2, 8, 6, 3, '107/6,110/10,110/11,125/15,126/15,126/2,127/15,128,129/12/2,41/7/2,119/9,', '130,131,', 1, 1, 1, '4,13,22,23,24,', 'Adeptus Astartes','', 135, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (43, 1, 19, 793, 4, 8, 10, 2, 12, 6, 4, '110/10,110/11,132/6,133/19/2,134/15,135/15,135/2,136/6,137/15,137/15,137/9,138/7/2,138/9,', '139,', 1, 1, 1, '4,22,23,', 'Adeptus Astartes','', 200, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (44, 1, 19, 744, 4, 8, 10, 2, 12, 6, 4, '140/9,118/13/1,118/9,141/19/4,141/7/3,141/9,142/12/2,142/9,', '143/9,144/9,145/9,', 1, 1, 1, '4,22,23,24,', 'Adeptus Astartes','', 175, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (45, 1, 19, 741, 4, 8, 10, 2, 12, 6, 4, '146/15,147,148,138/7/2,138/9,', '149,', 1, 1, 1, '4,22,23,', 'Adeptus Astartes','', 140, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (46, 1, 19, 789, 4, 12, 5, 3, 4, 6, 2, '62/1,129/12/2,136/6,44/9,', '63,150,', 3, 3, 6, '3,4,18,', 'Adeptus Astartes','', 95, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (47, 1, 19, 776, 4, 12, 5, 3, 8, 6, 2, '62/1,129/12/2,136/6,44/9,', '150,', 1, 1, 1, '3,4,18,', 'Adeptus Astartes','', 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (48, 1, 19, 806, 4, 12, 4, 3, 2, 6, 1, '151/17,36/1,', '57,', 3, 1, 3, '1,3,4,11,12,13,', 'Adeptus Astartes','', 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (49, 1, 19, 771, 4, 10, 6, 3, 3, 6, 1, '152/16,152/1,152/13/2,152/9,153/16,153/1,153/9,154/16,154/1,154/2,154/9,', '57,', 3, 3, 6, '1,4,8,11,12,', 'Adeptus Astartes','', 110, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (50, 1, 19, 800, 4, 14, 9, 3, 11, 6, 3, '104/15,136/6,123/7/3,123/9,', '86,', 1, 1, 1, '6,12,22,', 'Adeptus Astartes','', 130, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (51, 1, 19, 802, 4, 14, 9, 3, 11, 6, 3, '155,156,157/19/2,157/9,', '86,', 1, 1, 1, '6,12,22,', 'Adeptus Astartes','', 160, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (52, 1, 19, 801, 4, 14, 9, 3, 11, 6, 3, '158,159,160/12/2,', '86,', 1, 1, 1, '6,12,22,', 'Adeptus Astartes','', 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (53, 1, 19, 769, 4, 6, 4, 3, 2, 6, 1, '36/1,161/16,161/17,162/16,162/2,162/17,47/1,48/2,48/1,', '57,', 5, 5, 10, '1,3,4,5,', 'Adeptus Astartes','', 125, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (54, 1, 19, 761, 4, 6, 4, 3, 2, 6, 1, '36/1,163/17,163/4,164/4,165/17,', '57,', 3, 1, 3, '1,3,4,9,', 'Adeptus Astartes','', 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (55, 1, 19, 762, 4, 5, 6, 3, 3, 6, 1, '36/1,166/17,166/12/2,167/17,167/12/2,', '57,', 3, 3, 6, '1,3,4,8,', 'Adeptus Astartes','', 95, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (56, 1, 19, 758, 4, 6, 4, 3, 2, 6, 1, '36/1,45,168/8/2,168/17,66/17,66/13/1,169/17,81/15,81/17,82/17,167/17,167/12/2,', '63,57,76,77,78/6,79/9,', 5, 5, 10, '1,3,4,', 'Adeptus Astartes','', 120, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (57, 1, 19, 757, 4, 6, 4, 3, 2, 6, 1, '36/1,170/15,170/20,171/15,171/17,172/17,173/15,173/20,', '57,', 5, 5, 10, '1,3,4,5,68,', 'Adeptus Astartes','', 120, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (58, 1, 19, 757, 4, 6, 4, 3, 2, 6, 1, '36/1,170/15,170/20,171/15,171/17,172/17,173/15,173/20,', '57,', 5, 1, 5, '1,3,4,5,25,', 'Adeptus Astartes','', 200, 1.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (59, 1, 19, 763, 4, 3, 6, 2, 6, 6, 2, '174/9,175/9,', '57,', 1, 1, 2, '4,22,25,', 'Adeptus Astartes','', 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (60, 1, 19, 813, 4, 10, 10, 3, 11, 6, 3, '176/21,41/7/2,177/15,177/20,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 145, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (61, 1, 19, 791, 4, 10, 10, 3, 11, 6, 3, '118/13/1,176/21,179,180/7/2,41/7/2,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 130, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (62, 1, 19, 790, 4, 10, 10, 3, 11, 6, 3, '181/9,118/13/1,176/21,179,41/7/2,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 130, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (63, 1, 19, 764, 4, 10, 10, 3, 12, 6, 3, '104/15,133/19/2,182/7/3,183/17,41/7/2,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 160, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (64, 1, 19, 765, 4, 10, 10, 3, 12, 6, 3, '133/19/2,182/7/3,184/7/4,185/6,185/9,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (65, 1, 19, 766, 4, 10, 10, 3, 12, 6, 3, '133/19/2,182/7/3,186/12/2,187/9,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (66, 1, 19, 812, 4, 9, 11, 2, 11, 6, 3, '188/15,176/21,41/7/2,', '178,', 1, 1, 1, '4,13,22,', 'Adeptus Astartes','', 190, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (67, 1, 19, 779, 4, 10, 12, 2, 16, 6, 5, '189,176/21,129/12/2,41/7/2,118/13/1,118/9,', '190,', 1, 1, 1, '4,13,22,26,', 'Adeptus Astartes','', 240, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (68, 1, 19, 780, 4, 12, 12, 2, 16, 6, 5, '176/21,191/7/6,191/9,129/12/2,41/7/2,192/6,192/9,', '190,', 1, 1, 1, '3,4,13,22,26,', 'Adeptus Astartes','', 230, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (69, 1, 19, 781, 4, 12, 12, 2, 16, 6, 5, '193/10,193/11,176/21,129/12/2,41/7/2,192/6,192/9,', '190,', 1, 1, 1, '3,4,13,22,26,', 'Adeptus Astartes','', 260, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (70, 1, 19, 795, 4, 10, 12, 3, 16, 6, 5, '132/6,176/21,129/12/2,41/7/2,192/6,192/9,', '190,', 1, 1, 1, '4,13,22,26,', 'Adeptus Astartes','', 190, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (71, 1, 19, 796, 4, 10, 12, 3, 16, 6, 5, '194/17,132/6,133/19/2,182/7/3,134/15,135/15,135/2,195,118/13/1,118/9,196/19/4,196/7/3,196/9,', '190,', 1, 1, 1, '4,13,22,26,', 'Adeptus Astartes','', 220, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (72, 1, 19, 797, 3, 12, 9, 3, 10, 6, 2, '176/21,41/7/2,', '178,', 1, 1, 1, '4,13,22,26,27,', 'Adeptus Astartes','', 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (73, 1, 19, 792, 3, 12, 9, 3, 10, 6, 2, '176/21,41/7/2,192/6,192/9,118/13/1,118/9,119/9,', '178,', 1, 1, 1, '4,13,22,26,27,', 'Adeptus Astartes','', 95, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (74, 1, 19, 770, 3, 12, 9, 3, 11, 6, 2, '197/15,198/19/2,199,104/15,182/7/3,200/19/4,200/13/1,41/7/2,', '178,', 1, 1, 1, '4,22,26,27,', 'Adeptus Astartes','', 80, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (75, 1, 19, 760, 4, 0, 7, 3, 8, 6, 2, '201/15,41/7/2,', '', 1, 1, 1, '4,22,26,', 'Adeptus Astartes','', 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (76, 1, 19, 803, 4, 20, 9, 3, 10, 6, 0, '202/19/2,202/9,203,204/19/2,192/6,192/9,118/13/1,118/9,205/15,206,', '178,', 1, 1, 1, '4,12,13,22,28,', 'Adeptus Astartes','', 155, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (77, 1, 19, 805, 4, 20, 8, 3, 10, 6, 0, '204/19/2,192/6,192/9,118/13/1,118/9,119/9,205/15,206,', '178,', 1, 1, 1, '4,12,22,28,', 'Adeptus Astartes','', 165, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (78, 1, 19, 804, 4, 20, 10, 3, 14, 6, 0, '191/7/6,191/9,207,192/6,192/9,118/13/1,118/9,208/15,208/9,209/15,209/2,209/9,119/9,142/12/2,142/9,208/15,206,', '190,', 1, 1, 1, '4,12,22,26,28,', 'Adeptus Astartes','', 240, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (79, 1, 19, 767, 4, 0, 12, 2, 14, 6, 0, '210/22,210/13/1,210/9,211/22,211/10,211/11,212/15,213,', '', 1, 1, 1, '4,29,', 'Adeptus Astartes','', 175, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (80, 1, 29, 722, 1, 6, 4, 2, 5, 6, 1, '214/1,', '215/23,', 1, 1, 1, '1,2,4,7,30,', 'Adeptus Astartes, Ultramarines', 4, 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (81, 1, 29, 723, 1, 6, 4, 3, 4, 6, 1, '1/1,216/15,216/14,217/15,217/2,217/14,', '281/14,', 1, 1, 1, '1,2,4,14,30,', 'Adeptus Astartes, Ultramarines', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (82, 1, 29, 728, 1, 6, 6, 2, 6, 6, 1, '219/1,219/9,', '220/9,221,', 3, 1, 3, '2,8,30,31,', 'Adeptus Astartes, Ultramarines', 4, 185, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (83, 1, 29, 999, 1, 6, 4, 2, 3, 6, 1, '219/1,219/9,', '220/9,221,', 3, 1, 3, '1,4,', 'Adeptus Astartes, Ultramarines', 4, 185, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (84, 1, 29, 732, 1, 6, 4, 3, 5, 6, 1, '1/1,222,', '223,', 1, 1, 1, '1,2,4,7,30,', 'Adeptus Astartes, Ultramarines', 4, 75, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (85, 1, 29, 730, 1, 8, 9, 2, 10, 5, 4, '224/7/2,', '225/6,226/23,', 1, 1, 1, '2,4,30,32,33,', 'Adeptus Astartes, Ultramarines', 4, 360, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (86, 1, 24, 724, 1, 5, 5, 2, 6, 6, 1, '', '227/6,', 1, 1, 1, '1,2,4,7,10,30,', 'Adeptus Astartes, Imperial Fists', 4, 100, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (87, 1, 24, 731, 1, 5, 6, 3, 6, 6, 1, '228/8/2,', '229,', 1, 1, 1, '1,2,4,7,8,30,', 'Adeptus Astartes, Imperial Fists', 4, 90, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (88, 1, 24, 729, 1, 6, 4, 2, 5, 6, 1, '230/7/2,230/13/1,', '231,', 1, 1, 1, '1,2,3,4,30,31,', 'Adeptus Astartes, Imperial Fists', 4, 90, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (89, 1, 25, 725, 1, 5, 6, 2, 6, 6, 1, '1/1,232/13/2,', '233,234/3,', 1, 1, 1, '1,2,4,8,30,', 'Adeptus Astartes, Iron Hands','', 95, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (90, 1, 26, 726, 1, 12, 4, 3, 5, 6, 1, '235/1,235/4,', '236/4,236/9,', 1, 1, 1, '1,2,4,11,12,30,31,', 'Adeptus Astartes, Raven Guard', 4, 100, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (91, 1, 27, 721, 1, 6, 4, 2, 5, 6, 1, '237/1,237/10,237/11,', '238,', 1, 1, 1, '1,2,4,7,30,', 'Adeptus Astartes, Salamanders', 4, 85, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (92, 1, 27, 733, 1, 6, 4, 2, 5, 6, 1, '1/1,239/10,239/11,', '240,', 1, 1, 1, '1,2,3,4,7,30,', 'Adeptus Astartes, Salamanders', 4, 100, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (93, 1, 30, 727, 1, 6, 4, 3, 5, 6, 1, '1/1,', '241/6,241/4,', 1, 1, 1, '1,2,4,7,30,', 'Adeptus Astartes, White Scars', 4, 70, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (94, 1, 7, 371, 2, 12, 10, 3, 12, 7, 8, '242/12/2,243/7/3,244,', '245,', 1, 1, 1, '19,22,23,34,35,', 'Chaos Knights', 5, 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (95, 1, 7, 374, 2, 12, 10, 3, 12, 7, 8, '246,247/12/4,248/15,248/20,243/7/3,', '249,250,251,', 1, 1, 1, '19,22,23,34,35,', 'Chaos Knights', 5, 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (96, 1, 7, 373, 2, 14, 10, 3, 12, 7, 8, '243/7/3,248/15,248/20,', '252,253,254,', 1, 1, 1, '19,22,23,34,35,', 'Chaos Knights', 5, 140, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (97, 1, 7, 370, 2, 12, 10, 3, 12, 7, 8, '255,256/12/4,257/7/3,258/15,258/20,', '245,', 1, 1, 1, '19,22,23,34,35,', 'Chaos Knights', 5, 160, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (98, 1, 7, 372, 2, 12, 10, 3, 12, 7, 8, '242/12/2,247/12/4,243/7/3,', '249,250,', 1, 1, 1, '19,22,23,34,35,', 'Chaos Knights', 5, 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (99, 1, 7, 367, 1, 10, 12, 3, 22, 6, 10, '242/12/2,259/15,259/12/6,260/15,260/7/D6+3,261,262/15,262/20,263/10, 263/11,243/7/3,264,265/19/2,265/9,', '266,267,268,269,270,', 1, 1, 1, '2,22,23,34,36,37,38,', 'Chaos Knights', 5, 470, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (100, 1, 7, 366, 1, 10, 12, 3, 22, 6, 10, '271,257/7/3,', '266,267,269,270,', 1, 1, 1, '2,22,23,34,36,37,38,', 'Chaos Knights', 5, 450, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (101, 1, 7, 368, 1, 12, 12, 3, 22, 6, 10, '243/7/3/,', '272,273,274,275,', 1, 1, 1, '2,22,23,34,36,37,38,', 'Chaos Knights', 5, 380, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (102, 1, 7, 365, 1, 10, 12, 3, 22, 6, 10, '243/7/3/,276/6,', '277/3,278/13/1,', 1, 1, 1, '2,14,22,23,34,36,37,38,', 'Chaos Knights', 5, 455, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (103, 1, 7, 369, 1, 8, 13, 2, 24, 6, 10, '279/15,280/10,280/11,281/15,282/15,282/2,283/24/4,283/6,284/12/2,284/9,285/15,285/9,286/25/4,286/8/4,286/6,', '287,', 1, 1, 1, '2,22,23,34,36,37,', 'Chaos Knights', 5, 555, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (104, 1, 15, 570, 2, 12, 10, 3, 12, 7, 8, '288,289/12/2,290/7/3,', '291,', 1, 1, 1, '4,19,22,23,39,', 'Imperial Knights', 5, 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (105, 1, 15, 571, 2, 12, 10, 3, 12, 7, 8, '289/12/2,290/7/3,292/12/4,', '293,294,', 1, 1, 1, '4,19,22,23,39,', 'Imperial Knights', 5, 150, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (106, 1, 15, 577, 1, 10, 12, 3, 22, 6, 10, '295/19/2,295/9,296/15,296/20,289/12/2,290/7/3,297/15,297/7/D6+3,298,', '299,300,301,302,', 1, 1, 1, '2,4,22,23,36,37,40,', 'Imperial Knights', 5, 450, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (107, 1, 15, 575, 1, 10, 12, 3, 22, 6, 10, '295/19/2,295/9,296/15,296/20,289/12/2,290/7/3,298,303/15,303/12/6,', '299,300,301,302,', 1, 1, 1, '2,4,22,23,36,37,40,', 'Imperial Knights', 5, 430, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (108, 1, 15, 576, 1, 12, 12, 3, 22, 6, 10, '295/19/2,295/9,296/15,296/20,289/12/2,290/7/3,298,', '304,305,306,307,', 1, 1, 1, '2,4,22,23,36,37,40,', 'Imperial Knights', 5, 400, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (109, 1, 15, 580, 1, 10, 12, 3, 22, 6, 10, '308,309/10,309/11,295/19/2,295/9,296/15,296/20,289/12/2,290/7/3,298,', '299,300,301,302,', 1, 1, 1, '2,4,22,23,36,37,40,', 'Imperial Knights', 5, 480, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (110, 1, 15, 574, 1, 10, 12, 3, 22, 6, 10, '308,309/10,309/11,295/19/2,295/9,296/15,296/20,289/12/2,290/7/3,297/15,297/7/D6+3,298,303/12/6,', '310,', 1, 1, 1, '2,4,22,23,36,37,40,', 'Imperial Knights', 5, 475, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (111, 1, 15, 578, 1, 10, 12, 3, 22, 6, 10, '295/19/2,295/9,296/15,296/20,311/15,312/15,289/12/2,290/7/3,313,298,', '299,300,301,302,', 1, 1, 1, '2,4,22,23,36,37,40,', 'Imperial Knights', 5, 430, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (112, 1, 15, 573, 1, 8, 13, 2, 24, 6, 10, '314/15,315/15,315/2,316/24/4,316/6,317/12/2,317/9,318/15,318/9,319/15,', '320,', 1, 1, 1, '2,4,22,23,36,37,41,', 'Imperial Knights', 5, 565, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (113, 1, 15, 579, 1, 8, 13, 2, 24, 6, 10, '321/10,321/11,316/24/4,316/6,317/12/2,317/9,322/25/4,322/6/4,322/6,318/15,318/9,', '320,', 1, 1, 1, '2,4,22,23,36,37,41,', 'Imperial Knights', 5, 565, 0.1, 10);
INSERT INTO `db2at0k0xhmzqi`.`datasheet` (`id`, `game_id`, `faction_id`, `faction_unit_id`, `type`, `movement`, `toughness`, `save`, `wound`, `leadership`, `object_control`, `ranged_weapon`, `melee_weapon`, `unit_composition_min`, `unit_composition_shift`, `unit_composition_max`, `keywords`, `faction_keyword`, `invulnerable save`, `points`, `balance_version`, `edition`) VALUES (114, 1, 15, 572, 1, 10, 12, 3, 22, 5, 10, '323/15,323/13/1,324/15,324/13/1,325/13/1,', '326/13/1,327/13/1,', 1, 1, 1, '2,4,22,23,30,36,37,40,', 'Imperial Knights', 5, 460, 0.1, 10);

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`game_keyword_weapon`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (1, 1, 1, 'PISTOL');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (2, 1, 1, 'HAZARDOUS');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (3, 1, 1, 'EXTRA ATTACKS');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (4, 1, 1, 'PRECISION');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (5, 1, 1, 'ANTI-INFANTRY');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (6, 1, 1, 'DEVASTATING WOUNDS');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (7, 1, 1, 'RAPID FIRE');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (8, 1, 1, 'ANTI-VEHICLE');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (9, 1, 1, 'TWIN-LINKED');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (10, 1, 1, 'IGNORES COVER');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (11, 1, 1, 'TORRENT');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (12, 1, 1, 'MELTA');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (13, 1, 1, 'SUSTAINED HITS');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (14, 1, 1, 'PSYCHIC');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (15, 1, 1, 'BLAST');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (16, 1, 1, 'ASSAULT');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (17, 1, 1, 'HEAVY');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (18, 1, 1, 'ANTI-TYRANIDS');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (19, 1, 1, 'ANTI-FLY');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (20, 1, 1, 'INDIRECT FIRE');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (21, 1, 1, 'ONE SHOT');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (22, 1, 1, 'DEFENSIVE ARRAY');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (23, 1, 1, 'LETHAL HITS');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (24, 1, 1, 'ANTI-TITANIC');
INSERT INTO `db2at0k0xhmzqi`.`game_keyword_weapon` (`id`, `game_id`, `type`, `name`) VALUES (25, 1, 1, 'ANTI-MONSTER');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`faction_detachment`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (1, 1, 'Hallowed Martyrs', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (2, 2, 'Shield Host', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (3, 4, 'Battle Host', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (4, 5, 'Combined Regiment', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (5, 6, 'Daemonic Incursion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (6, 7, 'Traitoris Lance', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (7, 8, 'Slaves To Darkness', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (8, 10, 'Plague Company', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (9, 11, 'Realspace Raiders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (10, 12, 'Ascension Day', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (11, 13, 'Teleport Strike Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (12, 15, 'Noble Lance', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (13, 16, 'Oathband', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (14, 18, 'Waaagh! Tribe', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (15, 20, 'Righteous Crusaders', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (16, 21, 'Sons Of Sanguinius', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (17, 22, 'Unforgiven Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (18, 23, 'Black Spear Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (19, 28, 'Champions Of Russ', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (20, 31, 'Cult Of Magic', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (21, 34, 'Kauyon', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (22, 35, 'Berzerker Warband', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (23, 19, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (24, 19, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (25, 19, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (26, 19, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (27, 19, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (28, 19, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (29, 19, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (30, 24, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (31, 24, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (32, 24, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (33, 24, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (34, 24, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (35, 24, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (36, 24, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (37, 25, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (38, 25, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (39, 25, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (40, 25, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (41, 25, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (42, 25, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (43, 25, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (44, 26, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (45, 26, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (46, 26, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (47, 26, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (48, 26, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (49, 26, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (50, 26, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (51, 27, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (52, 27, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (53, 27, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (54, 27, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (55, 27, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (56, 27, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (57, 27, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (58, 29, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (59, 29, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (60, 29, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (61, 29, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (62, 29, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (63, 29, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (64, 29, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (65, 30, 'Gladius Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (66, 30, 'Anvil Siege Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (67, 30, 'Firestorm Assault Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (68, 30, 'Ironstorm Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (69, 30, 'Stormlance Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (70, 30, 'Vanguard Spearhead', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (71, 30, '1st Company Task Force', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (72, 3, 'Cohort Cybernetica', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (73, 3, 'Data-psalm Conclave', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (74, 3, 'Explorator Maniple', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (75, 3, 'Rad-zone Corps', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (76, 3, 'Skitarii Hunter Cohort', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (77, 17, 'Annihilation Legion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (78, 17, 'Awakened Dynasty', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (79, 17, 'Canoptek Court', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (80, 17, 'Hypercrypt Legion', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (81, 17, 'Obeisance Phalanx', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (82, 33, 'Assimilation Swarm', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (83, 33, 'Crusher Stampede', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (84, 33, 'Invasion Fleet', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (85, 33, 'Synaptic Nexus', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (86, 33, 'Unending Swarm', '10');
INSERT INTO `db2at0k0xhmzqi`.`faction_detachment` (`id`, `faction_id`, `name`, `edition`) VALUES (87, 33, 'Vanguard Onslaught', '10');

COMMIT;


-- -----------------------------------------------------
-- Data for table `db2at0k0xhmzqi`.`datasheet_weapon`
-- -----------------------------------------------------
START TRANSACTION;
USE `db2at0k0xhmzqi`;
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (1, 1, 19, 1, 'Bolt pistol', 12, '1', 2, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (2, 1, 19, 1, 'Heavy bolt pistol', 18, '1', 2, 4, 1, '1', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (3, 1, 19, 1, 'Master-crafted bolt rifle', 24, '2', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (4, 1, 19, 1, 'Plasma pistol â€“ standard', 12, '1', 2, 7, 2, '1', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (5, 1, 19, 1, 'Plasma pistol â€“ supercharge', 12, '1', 2, 8, 3, '2', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (6, 1, 19, 2, 'Close combat weapon', 0, '6', 2, 4, 0, '1', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (7, 1, 19, 2, 'Master-crafted power weapon', 0, '6', 2, 5, 2, '2', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (8, 1, 19, 2, 'Power fist', 0, '5', 2, 8, 2, '2', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (9, 1, 19, 1, 'Boltstorm gauntlet', 12, '3', 2, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (10, 1, 19, 1, 'Master-crafted heavy bolt rifle', 30, '2', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (11, 1, 19, 2, 'Relic blade', 0, '2', 2, 5, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (12, 1, 19, 2, 'Relic chainsword', 0, '3', 2, 4, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (13, 1, 19, 2, 'Relic fist', 0, '1', 2, 8, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (14, 1, 19, 1, 'Instigator bolt carbine', 24, '1', 2, 4, 2, '2', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (15, 1, 19, 2, 'Combat knife', 0, '6', 2, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (16, 1, 19, 1, 'Combi-weapon', 24, '1', 3, 4, 0, '1', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (17, 1, 19, 1, 'Storm bolter', 24, '2', 2, 4, 0, '1', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (18, 1, 19, 2, 'Chainfist', 0, '5', 3, 8, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (19, 1, 19, 2, 'Relic weapon', 0, '6', 2, 5, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (20, 1, 19, 2, 'Thunder hammer', 0, '5', 3, 8, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (21, 1, 19, 2, 'Twin lightning claws', 0, '7', 2, 5, 2, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (22, 1, 19, 1, 'Grav-pistol', 12, '1', 2, 4, 1, '2', 'CAPTAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (23, 1, 19, 1, 'Hand flamer', 12, 'D6', 'N/A', 3, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (24, 1, 19, 1, 'Inferno pistol', 6, '1', 2, 8, 4, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (25, 1, 19, 1, 'Master-crafted boltgun', 24, '2', 2, 4, 0, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (26, 1, 19, 1, 'Plasma pistol - standard', 12, '1', 2, 7, 2, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (27, 1, 19, 1, 'Plasma pistol - supercharge', 12, '1', 2, 8, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (28, 1, 19, 2, 'Astartes chainsword', 0, '7', 2, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (29, 1, 19, 1, 'Neo-volkite pistol', 12, '1', 2, 5, 0, '2', 'LIEUTENANT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (30, 1, 19, 2, 'Close combat weapon', 0, '5', 2, 4, 0, '1', 'LIEUTENANT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (31, 1, 19, 2, 'Master-crafted power weapon', 0, '5', 2, 5, 2, '2', 'LIEUTENANT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (32, 1, 19, 2, 'Power fist', 0, '4', 2, 8, 2, '2', 'LIEUTENANT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (33, 1, 19, 1, 'Master-crafted special issue bolt pistol', 12, '1', 2, 4, 0, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (34, 1, 19, 1, 'Master-crafted scoped bolt carbine', 24, '2', 2, 5, 0, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (35, 1, 19, 2, 'Paired combat blades', 0, '5', 2, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (36, 1, 19, 1, 'Bolt pistol', 12, '1', 3, 4, 0, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (37, 1, 19, 3, 'Smite - witchfire', 24, 'D6', 3, 5, 1, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (38, 1, 19, 3, 'Smite - focused witchfire', 24, 'D6', 3, 6, 2, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (39, 1, 19, 2, 'Force weapon', 0, '4', 3, 6, 1, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (40, 1, 19, 1, 'Combi-weapon', 24, '1', 4, 4, 0, '1', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (41, 1, 19, 1, 'Storm bolter', 24, '2', 3, 4, 0, '1', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (42, 1, 19, 1, 'Absolvor bolt pistol', 18, '1', 3, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (43, 1, 19, 2, 'Crozius arcanum', 0, '5', 2, 6, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (44, 1, 19, 1, 'Twin bolt rifle', 24, '2', 3, 4, 1, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (45, 1, 19, 1, 'Boltgun', 24, '2', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (46, 1, 19, 1, 'Grav-pistol', 12, '1', 3, 4, 1, '1', 'CHAPLAIN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (47, 1, 19, 1, 'Plasma pistol - standard', 12, '1', 3, 7, 2, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (48, 1, 19, 1, 'Plasma pistol - supercharge', 12, '1', 3, 8, 3, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (49, 1, 19, 1, 'Forge bolter', 24, '3', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (50, 1, 19, 1, 'Grav-pistol', 12, '1', 2, 4, 1, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (51, 1, 19, 2, 'Omnissian power axe', 0, '4', 3, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (52, 1, 19, 2, 'Servo-arm', 0, '1', 3, 8, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (53, 1, 19, 1, 'Astartes grenade launcher - frag', 24, 'D3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (54, 1, 19, 1, 'Astartes grenade launcher - krak', 24, '1', 3, 9, 2, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (55, 1, 19, 1, 'Bolt rifle', 24, '2', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (56, 1, 19, 2, 'Astartes chainsword', 0, '5', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (57, 1, 19, 2, 'Close combat weapon', 0, '3', 3, 4, 0, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (58, 1, 19, 2, 'Power fist', 0, '3', 3, 8, 2, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (59, 1, 19, 2, 'Power weapon', 0, '4', 3, 5, 2, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (60, 1, 19, 2, 'Thunder hammer', 0, '3', 4, 8, 2, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (61, 1, 19, 1, 'Pyreblaster', 12, 'D6', 'N/A', 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (62, 1, 19, 1, 'Heavy bolt pistol', 18, '1', 3, 4, 1, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (63, 1, 19, 2, 'Astartes chainsword', 0, '4', 3, 4, 1, '1', 'FIRST BORN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (64, 1, 19, 2, 'Paired combat blades', 0, '5', 2, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (65, 1, 19, 1, 'Heavy bolt rifle', 30, '2', 3, 5, 1, '1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (66, 1, 19, 1, 'Heavy bolter', 36, '3', 4, 5, 1, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (67, 1, 19, 1, 'Marksman bolt carbine', 24, '2', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (68, 1, 19, 1, 'Occulus bolt carbine', 24, '2', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (69, 1, 19, 2, 'Paired combat blades', 0, '3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (70, 1, 19, 1, 'Flamer', 12, 'D6', 'N/A', 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (71, 1, 19, 1, 'Grav-gun', 18, '2', 3, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (72, 1, 19, 1, 'Meltagun', 12, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (73, 1, 19, 1, 'Plasma gun - standard', 24, '1', 3, 7, 2, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (74, 1, 19, 1, 'Plasma gun - supercharge', 24, '1', 3, 8, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (75, 1, 19, 2, 'Close combat weapon', 0, '2', 3, 4, 0, '1', 'FIRST BORN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (76, 1, 19, 2, 'Power fist', 0, '2', 3, 8, 2, '2', 'FIRST BORN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (77, 1, 19, 2, 'Power weapon', 0, '3', 3, 5, 2, '1', 'FIRST BORN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (78, 1, 19, 2, 'Thunder hammer', 0, '2', 4, 8, 2, '2', 'FIRST BORN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (79, 1, 19, 2, 'Twin lightning claws', 0, '4', 3, 4, 2, '1', 'FIRST BORN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (80, 1, 19, 1, 'Astartes shotgun', 18, '2', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (81, 1, 19, 1, 'Missile launcher - frag', 48, 'D6', 4, 4, 0, '1', 'SCOUT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (82, 1, 19, 1, 'Missile launcher - krak', 48, '1', 4, 9, 2, 'D6', 'SCOUT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (83, 1, 19, 2, 'Combat knife', 0, '3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (84, 1, 19, 2, 'Power weapon', 0, '3', 3, 4, 2, '1', 'SCOUT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (85, 1, 19, 1, 'Reductor pistol', 3, '1', 3, 4, 4, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (86, 1, 19, 2, 'Close combat weapon', 0, '4', 3, 4, 0, '1', 'VETERAN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (87, 1, 19, 2, 'Power weapon', 0, '5', 2, 5, 2, '1', 'VETERAN');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (88, 1, 19, 2, 'Chainfist', 0, '4', 3, 8, 2, '2', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (89, 1, 19, 2, 'Thunder hammer', 0, '4', 3, 8, 2, '2', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (90, 1, 19, 2, 'Twin lightning claws', 0, '6', 2, 5, 2, '1', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (91, 1, 19, 1, 'Neo-volkite pistol', 12, '1', 3, 5, 0, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (92, 1, 19, 2, 'Master-crafted power weapon', 0, '4', 3, 5, 2, '2', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (93, 1, 19, 1, 'Inferno pistol', 6, '1', 3, 8, 4, 'D3', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (94, 1, 19, 2, 'Heirloom weapon', 0, '4', 3, 5, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (95, 1, 19, 1, 'Sternguard bolt pistol', 12, '1', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (96, 1, 19, 1, 'Sternguard bolt rifle', 24, '2', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (97, 1, 19, 1, 'Sternguard heavy bolter', 36, '3', 4, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (98, 1, 19, 2, 'Executioner relic blade', 0, '5', 2, 7, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (99, 1, 19, 1, 'Bolt carbine', 24, '2', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (100, 1, 19, 1, 'Special issue bolt pistol', 12, '1', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (101, 1, 19, 2, 'Combat knife', 0, '4', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (102, 1, 19, 1, 'Auto boltstorm gauntlets', 18, '3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (103, 1, 19, 1, 'Flamestorm gauntlets', 12, 'D6+1', 'N/A', 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (104, 1, 19, 1, 'Fragstorm grenade launcher', 18, 'D6', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (105, 1, 19, 2, 'Power fist', 0, '3', 4, 8, 2, '2', 'GRAVIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (106, 1, 19, 2, 'Twin lightning claws', 0, '5', 3, 5, 2, '1', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (107, 1, 19, 1, 'Assault cannon', 24, '6', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (108, 1, 19, 1, 'Cyclone missile launcher - frag', 36, '2D6', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (109, 1, 19, 1, 'Cyclone missile launcher - krak', 36, '2', 3, 9, 2, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (110, 1, 19, 1, 'Heavy flamer', 12, 'D6', 'N/A', 5, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (111, 1, 19, 2, 'Chainfist', 0, '3', 4, 8, 2, '2', 'TERMINATOR');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (112, 1, 19, 1, 'Centurion bolters', 24, '3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (113, 1, 19, 1, 'Twin flamer', 12, 'D6', 'N/A', 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (114, 1, 19, 1, 'Twin meltagun', 12, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (115, 1, 19, 2, 'Siege drills', 0, '3', 3, 10, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (116, 1, 19, 1, 'Centurion missile launcher', 36, 'D3', 3, 9, 2, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (117, 1, 19, 1, 'Grav-cannon', 24, '3', 3, 6, 1, '3', 'MOUNTED');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (118, 1, 19, 1, 'Twin heavy bolter', 36, '3', 3, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (119, 1, 19, 1, 'Twin lascannon', 48, '1', 3, 12, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (120, 1, 19, 2, 'Centurion fists', 0, '3', 4, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (121, 1, 19, 1, 'Incendium cannon', 12, 'D6+3', 'N/A', 6, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (122, 1, 19, 1, 'Twin ironhail autocannon', 48, '3', 3, 9, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (123, 1, 19, 1, 'Twin ironhail heavy stubber', 36, '3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (124, 1, 19, 2, 'Invictor fist', 0, '5', 3, 14, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (125, 1, 19, 1, 'Heavy plasma cannon - standard', 36, 'D3', 3, 7, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (126, 1, 19, 1, 'Heavy plasma cannon - supercharge', 36, 'D3', 3, 8, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (127, 1, 19, 1, 'Missile launcher - frag', 48, 'D6', 3, 4, 0, '1', 'DREADNOUGHT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (128, 1, 19, 1, 'Missile launcher - krak', 48, '1', 3, 9, 2, 'D6', 'DREADNOUGHT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (129, 1, 19, 1, 'Multi-melta', 18, '2', 3, 9, 4, 'D6', 'DREADNOUGHT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (130, 1, 19, 2, 'Close combat weapon', 0, '5', 3, 6, 0, '1', 'DREADNOUGHT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (131, 1, 19, 2, 'Dreadnought combat weapon', 0, '5', 3, 12, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (132, 1, 19, 1, 'Heavy onslaught gatling cannon', 24, '12', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (133, 1, 19, 1, 'Icarus rocket pod', 24, 'D3', 3, 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (134, 1, 19, 1, 'Macro plasma incinerator - standard', 36, 'D6+1', 3, 8, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (135, 1, 19, 1, 'Macro plasma incinerator - supercharge', 36, 'D6+1', 3, 9, 4, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (136, 1, 19, 1, 'Onslaught gatling cannon', 24, '8', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (137, 1, 19, 1, 'Twin fragstorm grenade launcher', 18, 'D6', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (138, 1, 19, 1, 'Twin storm bolter', 24, '2', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (139, 1, 19, 2, 'Redemptor fist', 0, '5', 3, 12, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (140, 1, 19, 1, 'Brutalis bolt rifles', 24, '4', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (141, 1, 19, 1, 'Twin Icarus ironhail heavy stubber', 36, '3', 3, 4, 1, '1', 'DREADNOUGHT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (142, 1, 19, 1, 'Twin multi-melta', 18, '2', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (143, 1, 19, 2, 'Brutalis fists', 0, '6', 3, 12, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (144, 1, 19, 2, 'Brutalis talons - strike', 0, '6', 3, 12, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (145, 1, 19, 2, 'Brutalis talons - sweep', 0, '10', 3, 7, 2, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (146, 1, 19, 1, 'Ballistus missile launcher - frag', 48, '2D6', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (147, 1, 19, 1, 'Ballistus missile launcher - krak', 48, '2', 3, 10, 2, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (148, 1, 19, 1, 'Ballistus lascannon', 48, '2', 3, 12, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (149, 1, 19, 2, 'Armoured feet', 0, '5', 3, 7, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (150, 1, 19, 2, 'Close combat weapon', 0, '5', 3, 4, 0, '1', 'MOUNTED');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (151, 1, 19, 1, 'Accelerator autocannon', 48, '3', 4, 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (152, 1, 19, 1, 'Assault bolters', 18, '3', 3, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (153, 1, 19, 1, 'Plasma exterminators - standard', 18, '2', 3, 7, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (154, 1, 19, 1, 'Plasma exterminators - supercharge', 18, '2', 3, 8, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (155, 1, 19, 1, 'Stormfury missiles', 48, '1', 2, 12, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (156, 1, 19, 1, 'Thunderstrike las-talon', 36, '2', 2, 9, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (157, 1, 19, 1, 'Twin Icarus rocket pod', 24, 'D3', 3, 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (158, 1, 19, 1, 'Hammerstrike missile launcher', 36, '2', 3, 9, 3, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (159, 1, 19, 1, 'Krakstorm grenade launcher', 18, '1', 3, 9, 1, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (160, 1, 19, 1, 'Melta destroyer', 18, '3', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (161, 1, 19, 1, 'Plasma incinerator - standard', 24, '2', 3, 7, 2, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (162, 1, 19, 1, 'Plasma incinerator - supercharge', 24, '2', 3, 8, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (163, 1, 19, 1, 'Bolt sniper rifle', 36, '1', 3, 5, 2, '3', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (164, 1, 19, 1, 'Instigator bolt carbine', 24, '1', 3, 4, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (165, 1, 19, 1, 'Las fusil', 36, '1', 3, 9, 3, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (166, 1, 19, 1, 'Melta rifle', 18, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (167, 1, 19, 1, 'Multi-melta', 18, '2', 4, 9, 4, 'D6', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (168, 1, 19, 1, 'Grav-cannon', 24, '3', 4, 6, 1, '3', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (169, 1, 19, 1, 'Lascannon', 48, '1', 4, 12, 3, 'D6+1', 'PRIMARIS');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (170, 1, 19, 1, 'Castellan launcher', 36, 'D3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (171, 1, 19, 1, 'Superfrag rocket launcher', 48, 'D6+1', 4, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (172, 1, 19, 1, 'Superkrak rocket launcher', 48, '1', 4, 10, 2, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (173, 1, 19, 1, 'Vengor launcher', 48, 'D6', 2, 7, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (174, 1, 19, 1, 'Twin Firestrike autocannon', 48, '3', 2, 9, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (175, 1, 19, 1, 'Twin Firestrike las-talon', 36, '2', 2, 10, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (176, 1, 19, 1, 'Hunter-killer missile', 48, '1', 2, 14, 3, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (177, 1, 19, 1, 'Whirlwind vengeance launcher', 72, 'D6+3', 3, 8, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (178, 1, 19, 2, 'Armoured tracks', 0, '3', 4, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (179, 1, 19, 1, 'Lascannon', 48, '1', 3, 12, 3, 'D6+1', 'VEHICLE');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (180, 1, 19, 1, 'Predator autocannon', 48, '4', 3, 9, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (181, 1, 19, 1, 'Predator twin lascannon', 48, '1', 3, 14, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (182, 1, 19, 1, 'Ironhail heavy stubber', 36, '3', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (183, 1, 19, 1, 'Lancer laser destroyer', 72, '2', 3, 14, 4, 'D6+3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (184, 1, 19, 1, 'Tempest bolter', 24, '4', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (185, 1, 19, 1, 'Twin heavy onslaught gatling cannon', 24, '12', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (186, 1, 19, 1, 'Multi-melta', 18, '2', 3, 10, 4, 'D6', 'VEHICLE');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (187, 1, 19, 1, 'Twin las-talon', 36, '2', 3, 10, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (188, 1, 19, 1, 'Demolisher cannon', 24, 'D6+3', 3, 14, 3, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (189, 1, 19, 1, 'Godhammer lascannon', 48, '2', 3, 12, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (190, 1, 19, 2, 'Armoured tracks', 0, '6', 4, 8, 0, '1', 'TRAMSPORT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (191, 1, 19, 1, 'Hurricane bolter', 24, '6', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (192, 1, 19, 1, 'Twin assault cannon', 24, '6', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (193, 1, 19, 1, 'Flamestorm cannon', 12, 'D6+3', 'N/A', 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (194, 1, 19, 1, 'Heavy laser destroyer', 72, '2', 3, 16, 4, 'D6+4', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (195, 1, 19, 1, 'Repulsor Executioner defensive array', 24, '10', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (196, 1, 19, 1, 'Twin Icarus ironhail heavy stubber', 36, '3', 3, 4, 0, '1', 'TRAMSPORT');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (197, 1, 19, 1, 'Bellicatus missile array - frag', 48, 'D6', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (198, 1, 19, 1, 'Bellicatus missile array - Icarus', 48, 'D3', 3, 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (199, 1, 19, 1, 'Bellicatus missile array - krak', 48, '1', 3, 8, 2, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (200, 1, 19, 1, 'Ironhail skytalon array', 36, '8', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (201, 1, 19, 1, 'Deathwind launcher', 12, 'D6+1', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (202, 1, 19, 1, 'Icarus stormcannon', 48, '6', 3, 7, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (203, 1, 19, 1, 'Las-talon', 36, '2', 3, 10, 3, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (204, 1, 19, 1, 'Skyhammer missile launcher', 48, '3', 3, 8, 1, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (205, 1, 19, 1, 'Typhoon missile launcher - frag', 48, '2D6', 3, 4, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (206, 1, 19, 1, 'Typhoon missile launcher - krak', 48, '2', 3, 9, 2, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (207, 1, 19, 1, 'Stormstrike missile launcher', 48, '1', 3, 10, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (208, 1, 19, 1, 'Twin heavy plasma cannon - standard', 36, 'D3', 3, 7, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (209, 1, 19, 1, 'Twin heavy plasma cannon - supercharge', 36, 'D3', 3, 8, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (210, 1, 19, 1, 'Hammerfall heavy bolter array', 36, '6', 4, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (211, 1, 19, 1, 'Hammerfall heavy flamer array', 12, '2D6', 'N/A', 5, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (212, 1, 19, 1, 'Hammerfall missile launcher - superfrag', 48, '2D6+2', 4, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (213, 1, 19, 1, 'Hammerfall missile launcher - superkrak', 48, '2', 4, 10, 2, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (214, 1, 19, 1, 'Artisan plasma pistol', 12, '1', 2, 8, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (215, 1, 19, 2, 'Talassarian Tempest Blade', 0, '6', 2, 5, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (216, 1, 19, 3, 'Storm of the Emperorâ€™s Wrath - witchfire', 18, 'D6', 2, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (217, 1, 19, 3, 'Storm of the Emperorâ€™s Wrath - focused witchfire', 18, '2D6', 2, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (218, 1, 19, 2, 'Rod of Tigurius', 0, '5', 3, 7, 2, 'D3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (219, 1, 19, 1, 'Gauntlets of Ultramar', 18, '4', 2, 4, 1, '2', 'DUAL');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (220, 1, 19, 2, 'Gauntlets of Ultramar', 0, '6', 2, 8, 3, '3', 'DUAL');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (221, 1, 19, 2, 'Victrix power sword', 0, '5', 2, 5, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (222, 1, 19, 1, 'Invictus', 24, '2', 2, 4, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (223, 1, 19, 2, 'Sword of Idaeus', 0, '6', 2, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (224, 1, 19, 1, 'Hand of Dominion', 30, '2', 2, 6, 2, '2', 'DUAL');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (225, 1, 19, 2, 'Emperorâ€™s Sword', 0, '14', 2, 8, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (226, 1, 19, 2, 'Hand of Dominion', 0, '7', 2, 14, 4, '4', 'DUAL');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (227, 1, 24, 2, 'Fist of Dorn', 0, '5', 2, 10, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (228, 1, 24, 1, 'Artificer grav-gun', 18, '2', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (229, 1, 24, 2, 'Hand of Defiance', 0, '5', 2, 12, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (230, 1, 24, 1, 'Dornâ€™s Arrow', 24, '2', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (231, 1, 24, 2, 'Fist of Retribution', 0, '5', 2, 8, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (232, 1, 25, 1, 'Gorgonâ€™s Wrath', 36, '3', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (233, 1, 24, 2, 'Harrowhand', 0, '6', 3, 7, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (234, 1, 24, 2, 'Medusan Manipuli', 0, '2', 3, 8, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (235, 1, 26, 1, 'Blackout', 18, '2', 2, 5, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (236, 1, 26, 2, 'The Ravenâ€™s Talons', 0, '7', 2, 5, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (237, 1, 27, 1, 'Drakkis', 12, 'D6+3', 'N/A', 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (238, 1, 27, 2, 'Malleus Noctum', 0, '5', 2, 10, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (239, 1, 27, 1, 'Gauntlet of the Forge', 12, 'D6+3', 'N/A', 6, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (240, 1, 27, 2, 'Spear of Vulkan', 0, '6', 2, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (241, 1, 30, 2, 'Moonfang', 0, '6', 2, 5, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (242, 1, 7, 1, 'Daemonbreath meltagun', 12, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (243, 1, 7, 1, 'Diabolus heavy stubber', 36, '3', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (244, 1, 7, 1, 'War Dog autocannon', 48, '4', 3, 9, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (245, 1, 7, 2, 'Armoured feet', 0, '4', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (246, 1, 7, 1, 'Avenger chaincannon', 24, '12', 3, 6, 1, '1', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (247, 1, 7, 1, 'Daemonbreath spear', 24, '2', 3, 12, 4, 'D6', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (248, 1, 7, 1, 'Havoc multi-launcher', 48, 'D6', 3, 5, 0, '1', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (249, 1, 7, 2, 'Reaper chaintalon - strike', 0, '4', 3, 10, 3, '3', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (250, 1, 7, 2, 'Reaper chaintalon - sweep', 0, '8', 3, 8, 2, '1', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (251, 1, 7, 2, 'Slaughterclaw', 0, '4', 3, 12, 3, 'D6+2', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (252, 1, 7, 2, 'Reaper chaintalon - strike', 0, '6', 2, 10, 3, '3', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (253, 1, 7, 2, 'Reaper chaintalon - sweep', 0, '12', 2, 8, 2, '1', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (254, 1, 7, 2, 'Slaughterclaw', 0, '6', 2, 12, 3, 'D6+2', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (255, 1, 7, 1, 'Avenger chaincannon', 24, '12', 2, 6, 1, '1', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (256, 1, 7, 1, 'Daemonbreath spear', 24, '2', 2, 12, 4, 'D6', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (257, 1, 7, 1, 'Diabolus heavy stubber', 36, '3', 2, 5, 0, '1', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (258, 1, 7, 1, 'Havoc multi-launcher', 48, 'D6', 2, 5, 0, '1', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (259, 1, 7, 1, 'Daemonbreath thermal cannon', 24, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (260, 1, 7, 1, 'Despoiler battle cannon', 72, '2D3', 3, 12, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (261, 1, 7, 1, 'Despoiler gatling cannon', 36, 'D6+3', 3, 10, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (262, 1, 7, 1, 'Havoc missile pod', 48, '18', 3, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (263, 1, 7, 1, 'Heavy darkflamer', 12, 'D6+1', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (264, 1, 7, 1, 'Ruinspear rocket pod', 48, '3', 3, 8, 2, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (265, 1, 7, 1, 'Hellstorm autocannons', 48, '3', 3, 7, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (266, 1, 7, 2, 'Reaper chainsword - strike', 0, '4', 3, 14, 4, '6', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (267, 1, 7, 2, 'Reaper chainsword - sweep', 0, '12', 3, 9, 3, '2', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (268, 1, 7, 2, 'Titanic feet', 0, '4', 3, 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (269, 1, 7, 2, 'Warpstrike claw - strike', 0, '4', 3, 20, 3, '8', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (270, 1, 7, 2, 'Warpstrike claw - sweep', 0, '8', 3, 10, 2, '3', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (271, 1, 7, 1, 'Desecrator laser destructor', 72, '3', 2, 18, 4, 'D6+3', 'WD1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (272, 1, 7, 2, 'Reaper chainsword - strike', 0, '6', 2, 14, 4, '6', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (273, 1, 7, 2, 'Reaper chainsword - sweep', 0, '18', 2, 9, 3, '2', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (274, 1, 7, 2, 'Warpstrike claw - strike', 0, '6', 2, 20, 3, '8', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (275, 1, 7, 2, 'Warpstrike claw - sweep', 0, '12', 2, 10, 2, '3', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (276, 1, 7, 1, 'Volkite combustor', 36, '3', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (277, 1, 7, 2, 'Balemace', 0, '3', 3, 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (278, 1, 7, 2, 'Electroscourge', 0, '9', 3, 10, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (279, 1, 7, 1, 'Brimstone volcano lance', 60, 'D3', 3, 20, 5, 'D6+8', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (280, 1, 7, 1, 'Darkflame cannon', 18, '3D6', 'N/A', 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (281, 1, 7, 1, 'Ectoplasma decimator - standard', 36, 'D6+3', 3, 8, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (282, 1, 7, 1, 'Ectoplasma decimator - supercharge', 36, 'D6+3', 3, 9, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (283, 1, 7, 1, 'Gheiststrike missile launcher', 72, '1', 3, 12, 6, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (284, 1, 7, 1, 'Twin daemonbreath meltagun', 12, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (285, 1, 7, 1, 'Twin desecrator cannon', 36, 'D6', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (286, 1, 7, 1, 'Warpshock harpoon', 18, '1', 2, 24, 6, '12', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (287, 1, 7, 2, 'Titanic feet', 0, '4', 4, 8, 1, '2', 'WD2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (288, 1, 15, 1, 'Armiger autocannon', 48, '4', 3, 9, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (289, 1, 15, 1, 'Meltagun', 12, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (290, 1, 15, 1, 'Questoris heavy stubber', 36, '3', 3, 4, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (291, 1, 15, 2, 'Armoured feet', 0, '4', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (292, 1, 15, 1, 'Thermal spear', 24, '2', 3, 12, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (293, 1, 15, 2, 'Reaper chain-cleaver - strike', 0, '4', 3, 10, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (294, 1, 15, 2, 'Reaper chain-cleaver - sweep', 0, '8', 3, 8, 2, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (295, 1, 15, 1, 'Icarus autocannons', 48, '3', 3, 7, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (296, 1, 15, 1, 'Ironstorm missile pod', 48, 'D6+1', 3, 5, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (297, 1, 15, 1, 'Rapid-fire battle cannon', 72, 'D6+3', 3, 10, 1, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (298, 1, 15, 1, 'Stormspear rocket pod', 48, '3', 3, 8, 2, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (299, 1, 15, 2, 'Reaper chainsword - strike', 0, '4', 3, 14, 4, '6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (300, 1, 15, 2, 'Reaper chainsword - sweep', 0, '12', 3, 9, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (301, 1, 15, 2, 'Thunderstrike gauntlet - strike', 0, '4', 3, 20, 3, '8', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (302, 1, 15, 2, 'Thunderstrike gauntlet - sweep', 0, '8', 3, 10, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (303, 1, 15, 1, 'Thermal cannon', 24, '2D3', 3, 12, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (304, 1, 15, 2, 'Reaper chainsword - strike', 0, '6', 2, 14, 4, '6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (305, 1, 15, 2, 'Reaper chainsword - sweep', 0, '18', 2, 9, 3, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (306, 1, 15, 2, 'Thunderstrike gauntlet - strike', 0, '6', 2, 20, 3, '8', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (307, 1, 15, 2, 'Thunderstrike gauntlet - sweep', 0, '12', 2, 10, 2, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (308, 1, 15, 1, 'Avenger gatling cannon', 36, '18', 3, 6, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (309, 1, 15, 1, 'Heavy flamer', 12, 'D6', 'N/A', 5, 1, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (310, 1, 15, 2, 'Titanic feet', 0, '4', 3, 8, 1, '2', 'KN1');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (311, 1, 15, 1, 'Las-impulsor - high intensity', 24, 'D6', 3, 14, 3, '4', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (312, 1, 15, 1, 'Las-impulsor - low intensity', 36, '2D6', 3, 7, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (313, 1, 15, 1, 'Preceptor multi-laser', 36, '4', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (314, 1, 15, 1, 'Plasma decimator - standard', 48, 'D6+3', 3, 8, 2, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (315, 1, 15, 1, 'Plasma decimator - supercharge', 48, 'D6+3', 3, 9, 3, '3', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (316, 1, 15, 1, 'Shieldbreaker missile launcher', 72, '1', 3, 12, 6, 'D6+1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (317, 1, 15, 1, 'Twin meltagun', 12, '1', 3, 9, 4, 'D6', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (318, 1, 15, 1, 'Twin siegebreaker cannon', 36, 'D6', 3, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (319, 1, 15, 1, 'Volcano lance', 72, 'D3', 3, 18, 5, 'D6+8', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (320, 1, 15, 2, 'Titanic feet', 0, '4', 4, 8, 1, '2', 'KN2');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (321, 1, 15, 1, 'Conflagration cannon', 18, '3D6', 'N/A', 8, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (322, 1, 15, 1, 'Thundercoil harpoon', 18, '1', 2, 24, 6, '12', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (323, 1, 15, 1, 'Chainbreaker las-impulsor - high intensity', 24, 'D6', 2, 14, 3, '4', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (324, 1, 15, 1, 'Chainbreaker las-impulsor - low intensity', 36, '2D6', 2, 7, 1, '2', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (325, 1, 15, 1, 'Chainbreaker multi-laser', 36, '4', 2, 6, 0, '1', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (326, 1, 15, 2, 'Freedomâ€™s Hand - strike', 0, '5', 2, 20, 3, '9', '');
INSERT INTO `db2at0k0xhmzqi`.`datasheet_weapon` (`id`, `game_id`, `faction_id`, `type`, `name`, `range`, `attack`, `skill`, `strength`, `penetration`, `damage`, `class`) VALUES (327, 1, 15, 2, 'Freedomâ€™s Hand - sweep', 0, '10', 2, 10, 2, '3', '');

COMMIT;

