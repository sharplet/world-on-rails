jQuery ->
  $('#countries').dataTable
    sDom: "<'row'<'span6'l>r>t<'row'<'span6'i><'span6'p>>"
    sPaginationType: "bootstrap"
    iDisplayLength: 25
    aoColumnDefs: [
      { aTargets: ['capital'], sWidth: '60px' }
      { aTargets: ['continent', 'population'], sWidth: '80px' }
      { aTargets: ['surface_area', 'internet_code'], sWidth: '100px' }
    ]
