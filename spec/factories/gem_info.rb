FactoryGirl.define do
  factory :gem_info, class: Hash do
    factory :g_owner__old_rev__new_rev do
      defaults = {
        owner: 'masutaka',
        gem_name: 'compare_linker',
      }

      factory :g_upgrade__owner__old_rev__new_rev do
        initialize_with do
          defaults.merge(
            old_rev: '1.1.1',
            new_rev: '1.1.2'
          )
        end
      end

      factory :g_downgrade__owner__old_rev__new_rev do
        initialize_with do
          defaults.merge(
            old_rev: '1.1.2',
            new_rev: '1.1.1'
          )
        end
      end
    end

    factory :g_homepage_uri__old_tag__new_tag do
      defaults = {
        owner:        nil,
        gem_name:     'serverspec',
        homepage_uri: 'http://serverspec.org/',
        repo_owner:   'mizzy',
        repo_name:    'serverspec',
      }

      factory :g_upgrade__homepage_uri__old_tag__new_tag do
        initialize_with do
          defaults.merge(
            old_ver: '2.24.0',
            new_ver: '2.24.1',
            old_tag: 'v2.24.0',
            new_tag: 'v2.24.1'
          )
        end
      end

      factory :g_downgrade__homepage_uri__old_tag__new_tag do
        initialize_with do
          defaults.merge(
            old_ver: '2.24.1',
            new_ver: '2.24.0',
            old_tag: 'v2.24.1',
            new_tag: 'v2.24.0'
          )
        end
      end
    end

    factory :g_homepage_uri do
      defaults = {
        owner:        nil,
        gem_name:     'mixlib-shellout',
        homepage_uri: 'https://www.chef.io/',
      }

      factory :g_upgrade__homepage_uri do
        initialize_with do
          defaults.merge(
            old_ver: '2.1.0',
            new_ver: '2.2.1'
          )
        end
      end

      factory :g_downgrade__homepage_uri do
        initialize_with do
          defaults.merge(
            old_ver: '2.2.1',
            new_ver: '2.1.0'
          )
        end
      end
    end

    factory :g_old_tag__new_tag do
      defaults = {
        owner:        nil,
        gem_name:     'chef',
        homepage_uri: nil,
        repo_owner:   'chef',
        repo_name:    'chef',
      }

      factory :g_upgrade__old_tag__new_tag do
        initialize_with do
          defaults.merge(
            old_ver: '12.4.1',
            new_ver: '12.4.3',
            old_tag: '12.4.1',
            new_tag: '12.4.3'
          )
        end
      end

      factory :g_downgrade__old_tag__new_tag do
        initialize_with do
          defaults.merge(
            old_ver: '12.4.3',
            new_ver: '12.4.1',
            old_tag: '12.4.3',
            new_tag: '12.4.1'
          )
        end
      end
    end

    factory :g_repo_owner__repo_name do
      defaults = {
        owner:        nil,
        gem_name:     'sfl',
        homepage_uri: nil,
        repo_owner:   'ujihisa',
        repo_name:    'spawn-for-legacy',
      }

      factory :g_upgrade__repo_owner__repo_name do
        initialize_with do
          defaults.merge(
            old_ver: '2.2',
            new_ver: '2.3'
          )
        end
      end

      factory :g_downgrade__repo_owner__repo_name do
        initialize_with do
          defaults.merge(
            old_ver: '2.3',
            new_ver: '2.2'
          )
        end
      end
    end

    factory :g_invalid_version__old_rev__new_rev do
      defaults = {
        owner: 'sds',
        gem_name: 'slim-lint',
      }

      factory :g_upgrade__invalid_version__old_rev__new_rev do
        initialize_with do
          defaults.merge(
            old_rev: '111e56fa5f4f75c03ad4043023232f7e972100d8',
            new_rev: 'dc24a0900a4bd29209b812e9119f5bc6eb3eb649'
          )
        end
      end

      factory :g_downgrade__invalid_version__old_rev__new_rev do
        initialize_with do
          defaults.merge(
            old_rev: 'dc24a0900a4bd29209b812e9119f5bc6eb3eb649',
            new_rev: '111e56fa5f4f75c03ad4043023232f7e972100d8'
          )
        end
      end
    end

    factory :g_else do
      defaults = {
        owner:        nil,
        gem_name:     'json',
        homepage_uri: nil,
      }

      factory :g_upgrade__else do
        initialize_with do
          defaults.merge(
            old_ver: '1.8.1',
            new_ver: '1.8.2'
          )
        end
      end

      factory :g_downgrade__else do
        initialize_with do
          defaults.merge(
            old_ver: '1.8.2',
            new_ver: '1.8.1'
          )
        end
      end
    end
  end
end
