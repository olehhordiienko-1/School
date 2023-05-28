math = Subject.new(name: "Математика", hours: 36, semesters:"Перший та другий")
math.save

urk_mova = Subject.new(name: "Українська мова", hours: 36, semesters:"Перший та другий")
urk_mova.save

english = Subject.new(name: "Англійська мова", hours: 48, semesters:"Другий")
english.save

german = Subject.new(name: "Німецька мова", hours: 18, semesters:"Перший")
german.save

ukr_lit = Subject.new(name: "Українська література", hours: 24, semesters:"Перший-другий")
ukr_lit.save

fiz_kult = Subject.new(name: "Фізична культура", hours: 16, semesters:"Другий")
fiz_kult.save

zv = Subject.new(name: "Захист Вітчизни", hours: 12, semesters:"Перший")
zv.save

physics = Subject.new(name: "Фізика", hours: 24, semesters:"Перший-другий")
physics.save

vereshchuk = PersonalRecord.new(last_name: "Верещук", middle_name: "Іванівна", first_name: "Світлана", education:"Вища освіта (ХПІ)", contacts:"vereshchuk.s@gmail.com", description:"")
vereshchuk.save

sereda = PersonalRecord.new(last_name: "Середа", middle_name: "Павлович", first_name: "Сергій", education:"Вища освіта (ХАІ)", contacts:"sereda_s@gmail.com", description:"")
sereda.save

magilin = PersonalRecord.new(last_name: "Магілін", middle_name: "Сергійович", first_name: "Владислав", education:"Вища освіта (ХНУРЕ)", contacts:"magilin.vl@gmail.com", description:"")
magilin.save

yeremenko = PersonalRecord.new(last_name: "Єременко", middle_name: "Сергійович", first_name: "Дмитро", education:"Вища освіта (КПІ)", contacts:"yeremenko_d.s@gmail.com", description:"")
yeremenko.save

lipoviy = PersonalRecord.new(last_name: "Липовий", middle_name: "Вʼячеславович", first_name: "Арсеній", education:"Вища освіта (ХНУ ім.Каразіна)", contacts:"lipoviy.arseniy@gmail.com", description:"")
lipoviy.save

maksimenko = PersonalRecord.new(last_name: "Максименко", middle_name: "Прохорович", first_name: "Йосип", education:"Повна середня освіта", contacts:"maksimenko.y.p@gmail.com", description:"")
maksimenko.save

ivashchenko = PersonalRecord.new(last_name: "Іващенко", middle_name: "Іванович", first_name: "Іван", education:"Вища освіта (ХПІ)", contacts:"ivashchenko.i@gmail.com", description:"")
ivashchenko.save

moskalenko = PersonalRecord.new(last_name: "Москаленко", middle_name: "Володимирович", first_name: "Сергій", education:"Вища освіта (КНЕУ)", contacts:"moskalenko.s@gmail.com", description:"")
moskalenko.save

vovk = PersonalRecord.new(last_name: "Вовк", middle_name: "Олегович", first_name: "Максим", education:"Вища освіта (ХНУПС)", contacts:"vovk.m@gmail.com", description:"")
vovk.save

kurgan = PersonalRecord.new(last_name: "Курган", middle_name: "Мстиславович", first_name: "Всеволод", education:"Вища освіта (ХНУРЕ)", contacts:"kurgan.v.m@gmail.com", description:"")
kurgan.save

borodach = PersonalRecord.new(last_name: "Бородач", middle_name: "Сергійович", first_name: "Родіон", education:"Повна середня освіта", contacts:"boroda.r.s@gmail.com", description:"")
borodach.save

svyatiy = PersonalRecord.new(last_name: "Святий", middle_name: "Микитович", first_name: "Микола", education:"Вища освіта (ХПІ)", contacts:"svyatiy.m.m@gmail.com", description:"")
svyatiy.save

SubjectTeacher.create(personal_record: vereshchuk, subject: urk_mova, academic_year: 2023)
SubjectTeacher.create(personal_record: sereda, subject: physics, academic_year: 2023)
SubjectTeacher.create(personal_record: magilin, subject: ukr_lit, academic_year: 2023)
SubjectTeacher.create(personal_record: borodach, subject: fiz_kult, academic_year: 2023)
SubjectTeacher.create(personal_record: moskalenko, subject: math, academic_year: 2023)
SubjectTeacher.create(personal_record: kurgan, subject: math, academic_year: 2023)
SubjectTeacher.create(personal_record: ivashchenko, subject: german, academic_year: 2023)
SubjectTeacher.create(personal_record: lipoviy, subject: english, academic_year: 2023)
SubjectTeacher.create(personal_record: yeremenko, subject: zv, academic_year: 2023)
SubjectTeacher.create(personal_record: vovk, subject: physics, academic_year: 2023)