CREATE SCHEMA IF NOT EXISTS `Quan_ly_giaydonhang` DEFAULT CHARACTER SET utf8mb4 ;
USE `Quan_ly_giay` ;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Giohang` (
  `Magiohang` INT NOT NULL,
  `Tensp` VARCHAR(45) NULL,
  `Mau` VARCHAR(20) NULL,
  `Gia` INT NULL,
  `Size` VARCHAR(5) NULL,
  `Soluong` INT NULL,
  `Tongtien` INT NULL,
  PRIMARY KEY (`Magiohang`))
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Khachhang` (
  `idKhachhang` INT NOT NULL,
  `Makhachhang` VARCHAR(20) NULL,
  `Tenkhachhang` VARCHAR(45) NULL,
  `Diachi` VARCHAR(45) NULL,
  `Sdt` VARCHAR(45) NULL,
  `Ngaysinh` VARCHAR(10) NULL,
  `Gioitinh` VARCHAR(3) NULL,
  `Giohang_Magiohang` INT NOT NULL,
  PRIMARY KEY (`idKhachhang`),
  INDEX `fk__Giohang1_idx` (`Giohang_Magiohang` ASC) VISIBLE,
  CONSTRAINT `fk__Giohang1`
    FOREIGN KEY (`Giohang_Magiohang`)
    REFERENCES `Quan_ly_giay`.`Giohang` (`Magiohang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Tongdonhang` (
  `idTongdonhang` INT NOT NULL,
  `Madonhang` VARCHAR(45) NULL,
  PRIMARY KEY (`idTongdonhang`))
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Donhang` (
  `Iddonhang` INT NOT NULL,
  `Mahang` VARCHAR(20) NULL,
  `Ngaytaodon` TIMESTAMP(6) NULL,
  `Phuongthucthanhtoan` VARCHAR(20) NULL,
  `Diachi` VARCHAR(20) NULL,
  `Magiamgia` VARCHAR(5) NULL,
  `Donhangcol` VARCHAR(45) NULL,
  `Giohang_Magiohang` INT NOT NULL,
  PRIMARY KEY (`Iddonhang`),
  INDEX `fk_Donhang_Giohang1_idx` (`Giohang_Magiohang` ASC) VISIBLE,
  CONSTRAINT `fk_Donhang_Giohang1`
    FOREIGN KEY (`Giohang_Magiohang`)
    REFERENCES `Quan_ly_giay`.`Giohang` (`Magiohang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Giay` (
  `Magiay` VARCHAR(20) NOT NULL,
  `Tengiay` VARCHAR(45) NULL,
  `Mau` VARCHAR(45) NULL,
  `Giaycol` VARCHAR(45) NULL,
  `Giohang_Magiohang` INT NOT NULL,
  `Donhang_Iddonhang` INT NOT NULL,
  PRIMARY KEY (`Magiay`),
  INDEX `fk_Giay_Giohang1_idx` (`Giohang_Magiohang` ASC) VISIBLE,
  INDEX `fk_Giay_Donhang1_idx` (`Donhang_Iddonhang` ASC) VISIBLE,
  CONSTRAINT `fk_Giay_Giohang1`
    FOREIGN KEY (`Giohang_Magiohang`)
    REFERENCES `Quan_ly_giay`.`Giohang` (`Magiohang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Giay_Donhang1`
    FOREIGN KEY (`Donhang_Iddonhang`)
    REFERENCES `Quan_ly_giay`.`Donhang` (`Iddonhang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Loaigiay` (
  `Magiay` VARCHAR(20) NOT NULL,
  `Maugiau` VARCHAR(45) NULL,
  `Soluong` VARCHAR(45) NULL,
  `Giay_Magiay` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Magiay`),
  INDEX `fk_Loaigiay_Giay_idx` (`Giay_Magiay` ASC) VISIBLE,
  CONSTRAINT `fk_Loaigiay_Giay`
    FOREIGN KEY (`Giay_Magiay`)
    REFERENCES `Quan_ly_giay`.`Giay` (`Magiay`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Sale` (
  `MaGiamgia` INT NOT NULL,
  `Salecol` VARCHAR(45) NULL,
  `Giay_Magiay` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`MaGiamgia`),
  INDEX `fk_Sale_Giay1_idx` (`Giay_Magiay` ASC) VISIBLE,
  CONSTRAINT `fk_Sale_Giay1`
    FOREIGN KEY (`Giay_Magiay`)
    REFERENCES `Quan_ly_giay`.`Giay` (`Magiay`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Nam` (
  `idgiaynam` INT NOT NULL,
  `Magiay` VARCHAR(20) NULL,
  `Size` VARCHAR(5) NULL,
  `Soluong` INT NULL,
  `Loaigiay_Magiay` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idgiaynam`),
  INDEX `fk_Nam_Loaigiay1_idx` (`Loaigiay_Magiay` ASC) VISIBLE,
  CONSTRAINT `fk_Nam_Loaigiay1`
    FOREIGN KEY (`Loaigiay_Magiay`)
    REFERENCES `Quan_ly_giay`.`Loaigiay` (`Magiay`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS `Quan_ly_giay`.`Nu` (
  `idGiayNu` INT NOT NULL,
  `Magiay` VARCHAR(20) NULL,
  `Size` VARCHAR(5) NULL,
  `Soluong` INT NULL,
  `Loaigiay_Magiay` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idGiayNu`),
  INDEX `fk_Nu_Loaigiay1_idx` (`Loaigiay_Magiay` ASC) VISIBLE,
  CONSTRAINT `fk_Nu_Loaigiay1`
    FOREIGN KEY (`Loaigiay_Magiay`)
    REFERENCES `Quan_ly_giay`.`Loaigiay` (`Magiay`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

