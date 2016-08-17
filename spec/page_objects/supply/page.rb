module PageObject
  module Supply
    class Page < PageObject::Page

      set_url '/circles/{circle_id}/supplies/{supply_id}?as={as}'

      include HasItemDetailsTable

      element :headline, '.task-header .title'
      element :description, '.task-header .description'

      section :edit_menu, PageObject::Component::EditMenu, 'aside'

      # FIXME factor out
      def load_for(supply, as:)
        load(circle_id: supply.circle.id, supply_id: supply.id, as: as.id)
      end

      # FIXME factor out
      def completed?
        find('.task.urgency--complete')
      end

      # FIXME factor out
      def new?
        find('.task.urgency--new')
      end

    end
  end
end