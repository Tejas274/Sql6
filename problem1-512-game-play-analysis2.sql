with row_num_based_user_activity as (
    select
        player_id,
        device_id,
        row_number() over (
            partition by player_id
            order by event_date
        ) as rnk
    from activity
)

select
    player_id,
    device_id
from
    row_num_based_user_activity
where
    rnk = 1