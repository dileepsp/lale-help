module PageObject
  module Circle
    class MyActivities < PageObject::Page

      set_url '/circles/{circle_id}/taskables/volunteer{?as}'

      section :tab_nav, '.tab-nav' do
        element :organizing, 'a', text: /Organizing/
        # a little hack to be able to add a load validation 
        # (this page object can be used for the volunteering and organizing tabs)
        element :organizing_active, 'a.selected', text: /Organizing/
      end

      # FIXME DRY up
      sections :tasks, '#my-tasks-list' do
        element :name, '.task-title'
      end

      # FIXME DRY up
      sections :supplies, '#my-supplies-list' do
        element :name, '.task-title'
      end

      # FIXME DRY up
      def has_task?(task_to_find)
        tasks.any? { |task| task.name.text == task_to_find.name }
      end

      # FIXME DRY up
      def has_supply?(supply_to_find)
        supplies.any? { |supply| supply.name.text == supply_to_find.name }
      end

    end
  end
end