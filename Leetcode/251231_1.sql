/*
3374. First Letter Capitalization II
*/

    select content_id 
        , content_text as original_text
        , case
            when REGEXP_LIKE(content_text, '[^[:alpha:] -]')
            then content_text
            else REGEXP_REPLACE(INITCAP(content_text),'([[:alpha:]])-([[:alpha:]])', '\1-\2')
          end as converted_text          
    from user_content 
