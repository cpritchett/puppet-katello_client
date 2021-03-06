class katello_client::package {

 ####Package Management#####
  if $katello_client::agent_install == true {

    if $katello_client::version == latest {

      package { 'katello-agent':
        ensure    => latest,
        require   => Yumrepo['katello-pulp'],
      }
    } else {
      package { 'katello-agent':
        ensure    => "$katello_client::version",
        require   => Yumrepo['katello-pulp'],
      }
    }
      if $katello_client::subman_version == latest {
        package {'subscription-manager':
          ensure  => latest,
          require => Yumrepo['sub-manager'],
        }
      } else {
        package { 'subscription-manager':
          ensure  => "$katello_client::subman_version",
          require => Yumrepo['sub-manager'],
        }
      }
    } else {
    if $katello_client::subman_version == latest {
        package {'subscription-manager':
          ensure  => latest,
          require => Yumrepo['sub-manager'],
        }
      } else {
        package { 'subscription-manager':
          ensure  => "$katello_client::subman_version",
          require => Yumrepo['sub-manager'],
        }
      }
    }
#  fail("Katello-client version must be latest, or valid version number, you have provided \"${katello_client::version}\"")
}
