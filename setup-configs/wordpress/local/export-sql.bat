CALL variables.bat
cd %misc_path%
mysqldump -u root  %database% >  %database%_db.sql