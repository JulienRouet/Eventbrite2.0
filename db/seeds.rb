User.create(email: 'ano@nym.ous', password: 'password')

5.times do
  event = Event.create(
    title: "tous pour jonny",
    description: 'emaillbnczfiuzeyf iuzr  lizricr,truil,rslg,ssrleti,lsiu,hslh sns,tr',
    start_date: Faker::Time.forward,
    duration: 125,
    price: 900,
    location: 'paname'
  )
  Attendance.create(user: User.first, event: event, creator: true)
end
