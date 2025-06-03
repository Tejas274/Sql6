select
    round(min(sqrt(power(p2.x - p1.x, 2) + power(p2.y - p1.y, 2))), 2)
        as shortest
from
    point2d as p1
inner join
    point2d as p2
    on (p1.x, p1.y) < (p2.x, p2.y)