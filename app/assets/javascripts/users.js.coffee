$(document).on "turbolinks:load", ->
    $('#users_datatable').DataTable
        responsive: true,
        pagingType: 'full_numbers'
