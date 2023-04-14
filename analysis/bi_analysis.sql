-- which channel is leading to the highest value conversions?
-- use forty_twenty_forty_points
-- from score; facebook_ads convert a higher
select
    date_trunc('week', converted_at) as date_week,
    -- utm_campaign,
    utm_source,
    sum(forty_twenty_forty_points) as attribution_points
    ,sum(forty_twenty_forty_revenue) as attribution_revenue
from {{ ref("attribution_touches") }} 
group by 1, 2
order by date_week, utm_source
