jQuery ->
$(".calendar-day").on "click", ->
    date = $(this).data("date")
    location.href = "/calendar_events/new[start_time]=#{date}"
