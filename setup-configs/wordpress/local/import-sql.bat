CALL variables.bat
SET query_str="UPDATE %wp_prefix%options SET option_value = replace(option_value, %source_domain% , %dest_domain% ) WHERE option_name = 'home' OR option_name = 'siteurl'; UPDATE %wp_prefix%posts SET guid = replace(guid, %source_domain% ,%dest_domain% ); UPDATE %wp_prefix%posts SET post_content = replace(post_content, %source_domain% , %dest_domain% ); UPDATE %wp_prefix%postmeta SET meta_value = replace(meta_value, %source_domain% , %dest_domain% ); UPDATE %wp_prefix%posts SET post_excerpt = replace(post_excerpt, %source_domain% , %dest_domain% )"
cd %misc_path%
mysql -u root -e "DROP DATABASE IF EXISTS %database% ;"
echo "removed database"
mysql -u root -e "CREATE DATABASE %database% ; "
mysql -u root %database% < %database%_db.sql
echo %query_str%
mysql -u root %database% -e %query_str%
PAUSE
