select
    FIRSTNAME,
    LASTNAME,
    CITY,
    STATE
from
    PERSON
left join
    ADDRESS
    on
      PERSON.PERSONID = ADDRESS.PERSONID