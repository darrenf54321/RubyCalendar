jQuery ->
  $(".calendar-day").on "click", ->
    date = $(this).data("date")
    location.href = "/calendar_events/new?calendar_event[start_time]=#{date}"
