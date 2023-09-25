//= require trix
getUrl = () => {
  return location.origin + location.pathname + '/';
}

handleDeleteJob = jobId => {
  swal({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!'
  }).then(result => {
    if (result.value) {
      swal.enableLoading();
      $.ajax({
        type: 'DELETE',
        data: {
          id: jobId
        },
        url: getUrl() + `/${jobId}`,
        beforeSend: () => {
          swal({
            title: 'Đang Xoá .....',
            html: 'Việc sẽ được xoá trong 2 giây.',
            timer: 2000,
            timerProgressBar: true,
            onBeforeOpen: () => {
              swal.showLoading()
              timerInterval = setInterval(() => {
                const content = swal.getContent()
                if (content) {
                  const b = content.querySelector('b')
                  if (b) {
                    b.textContent = swal.getTimerLeft()
                  }
                }
              }, 100)
            },
            onClose: () => {
              clearInterval(timerInterval)
            }
          })
        }
      }).done(() => {
        swal(
          'Deleted!',
          'This job has been deleted.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          error.statusText,
          'This job has been deleted.',
          'warning'
        )
      })
    }
  });
}

handleApproveJob = jobId => {
  swal({
    title: 'Do you want to approve this job?',
    text: 'Let this job live to user',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Approve it!'
  }).then(result => {
    if (result.value) {
      $.ajax({
        type: 'POST',
        url: location.origin + `/admin/job/approve?id=${jobId}`
      }).done(() => {
        swal(
          'Approved!',
          'This job has been approved.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          error.status,
          error.statusText,
          'error'
        )
      })
    }
  });
}

handleBlockAccount = userId => {
  swal({
    title: 'Do you want to block this account?',
    text: 'Let block this account!',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Block it!'
  }).then(result => {
    if (result.value) {
      $.ajax({
        type: 'POST',
        url: location.origin + '/admin/blocking/',
        data: {
          userId
        }
      }).done(() => {
        swal(
          'Account blocked!',
          'This account has been blocked.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          'Block account fail!',
          error.statusText,
          'warning'
        );
      })
    }
  });
}

handleOpenAccount = userId => {
  swal({
    title: 'Do you want to open this account?',
    text: 'Let open this account!',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Open it!'
  }).then(result => {
    if (result.value) {
      $.ajax({
        type: 'POST',
        url: location.origin + '/admin/blocking/',
        data: {
          userId
        }
      }).done(() => {
        swal(
          'Account opened!',
          'This account has been opened.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          'Open account fail',
          error.statusText,
          'warning'
        );
      })
    }
  });
}

deleteUser = userId => {
  swal({
    title: 'Do you want to delete it?',
    text: 'Let delete this account!',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Delete it!'
  }).then(result => {
    if (result.value) {
      $.ajax({
        type: 'DELETE',
        url: location.origin + `/admin/users/${userId}`
      }).done(() => {
        swal(
          'User deleted!',
          'This user has been deleted.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          'User not deleted!',
          error.statusText,
          'warning'
        );
      })
    }
  });
}

handleChangeStatusCV = (id, status) => {
  $('#cv-id').val(id);
  $('#id-cv-status').val(status);
  $.ajax({ type: 'GET', url: location.origin + `/api/v1/cvs/${id}` }).done(response => $('#cv-id-candidate-name').val(response.candidate_name)).fail(error => {
    swal(error.status, error.statusText, 'error')
  })
}

resetValueForElement = list => {
  list.map(item => $(item).val(''));
}

deleteCVByID = (jobID, cvID) => {
  swal({
    title: 'Do you want to delete this CV?',
    text: 'Let delete this CV!',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Delete it!'
  }).then(result => {
    if (result.value) {
      $.ajax({
        type: 'DELETE',
        url: location.origin + `/admin/jobs/${jobID}/cvs/${cvID}`
      }).done(() => {
        swal(
          'CV deleted!',
          'This CV has been deleted.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          'CV not deleted!',
          error.statusText,
          'warning'
        );
      })
    }
  });
}

deleteEmailMarketing = emailMarketingID => {
  swal({
    title: 'Delete this email?',
    text: 'Let delete this email!',
    type: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, Delete it!'
  }).then(result => {
    if (result.value) {
      $.ajax({
        type: 'DELETE',
        url: location.origin + `/admin/email_marketings/${emailMarketingID}`
      }).done(() => {
        swal(
          'Email marketing deleted!',
          'This email has been deleted.',
          'success'
        ).then(isConfirm => isConfirm && location.reload());
      }).fail(error => {
        swal(
          'Email not deleted!',
          error.statusText,
          'warning'
        );
      })
    }
  });
}