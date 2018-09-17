require 'spec_helper'

describe CompareLinker::Formatter::Text do
  describe '#format' do
    subject { described_class.new.format(gem_info) }

    context 'given upgrade (normal)' do
      context 'given owner && old_rev && new_rev' do
        # This spec may be unnecessary.
        let(:gem_info) { build(:g_upgrade__owner__old_rev__new_rev) }
        it { is_expected.to eq 'compare_linker: https://github.com/masutaka/compare_linker/compare/1.1.1...1.1.2' }
      end

      context 'given homepage_uri && old_tag && new_tag' do
        let(:gem_info) { build(:g_upgrade__homepage_uri__old_tag__new_tag) }
        it { is_expected.to eq 'serverspec (http://serverspec.org/): https://github.com/mizzy/serverspec/compare/v2.24.0...v2.24.1' }
      end

      context 'given homepage_uri' do
        let(:gem_info) { build(:g_upgrade__homepage_uri) }
        it { is_expected.to eq 'mixlib-shellout (https://www.chef.io/): 2.1.0...2.2.1' }
      end

      context 'given old_tag && new_tag' do
        let(:gem_info) { build(:g_upgrade__old_tag__new_tag) }
        it { is_expected.to eq 'chef: https://github.com/chef/chef/compare/12.4.1...12.4.3' }
      end

      context 'given repo_owner && repo_name' do
        let(:gem_info) { build(:g_upgrade__repo_owner__repo_name) }
        it { is_expected.to eq 'sfl: https://github.com/ujihisa/spawn-for-legacy 2.2...2.3' }
      end

      context 'given invalid version' do
        let(:gem_info) { build(:g_upgrade__invalid_version__old_rev__new_rev) }
        it { is_expected.to eq 'slim-lint: https://github.com/sds/slim-lint/compare/111e56fa5f4f75c03ad4043023232f7e972100d8...dc24a0900a4bd29209b812e9119f5bc6eb3eb649' }
      end

      context 'given else' do
        let(:gem_info) { build(:g_upgrade__else) }
        it { is_expected.to eq 'json (link not found): 1.8.1...1.8.2' }
      end
    end

    context 'given downgrade' do
      context 'given owner && old_rev && new_rev' do
        # This spec may be unnecessary.
        let(:gem_info) { build(:g_downgrade__owner__old_rev__new_rev) }
        it { is_expected.to eq 'compare_linker: https://github.com/masutaka/compare_linker/compare/1.1.1...1.1.2 (downgrade)' }
      end

      context 'given homepage_uri && old_tag && new_tag' do
        let(:gem_info) { build(:g_downgrade__homepage_uri__old_tag__new_tag) }
        it { is_expected.to eq 'serverspec (http://serverspec.org/): https://github.com/mizzy/serverspec/compare/v2.24.0...v2.24.1 (downgrade)' }
      end

      context 'given homepage_uri' do
        let(:gem_info) { build(:g_downgrade__homepage_uri) }
        it { is_expected.to eq 'mixlib-shellout (https://www.chef.io/): 2.2.1...2.1.0 (downgrade)' }
      end

      context 'given old_tag && new_tag' do
        let(:gem_info) { build(:g_downgrade__old_tag__new_tag) }
        it { is_expected.to eq 'chef: https://github.com/chef/chef/compare/12.4.1...12.4.3 (downgrade)' }
      end

      context 'given repo_owner && repo_name' do
        let(:gem_info) { build(:g_downgrade__repo_owner__repo_name) }
        it { is_expected.to eq 'sfl: https://github.com/ujihisa/spawn-for-legacy 2.3...2.2 (downgrade)' }
      end

      context 'given invalid version' do
        let(:gem_info) { build(:g_downgrade__invalid_version__old_rev__new_rev) }
        it { is_expected.to eq 'slim-lint: https://github.com/sds/slim-lint/compare/dc24a0900a4bd29209b812e9119f5bc6eb3eb649...111e56fa5f4f75c03ad4043023232f7e972100d8' }
      end
      context 'given else' do
        let(:gem_info) { build(:g_downgrade__else) }
        it { is_expected.to eq 'json (link not found): 1.8.2...1.8.1 (downgrade)' }
      end
    end
  end
end
