class StoreController < ApplicationController
  # Temp feature structure
  Feature = Struct.new(:title, :enabled, :description)

  def index
    @features = [
      Feature.new(
        'Contact Managment',
        true,
        'Curabitur in lacus consequat quam cursus viverra. Suspendisse potenti. Maecenas pretium velit quam, blandit malesuada sapien pulvinar non. Duis odio eros, ullamcorper ut libero at, cursus vehicula odio. In hac habitasse platea dictumst.'
      ),
      Feature.new(
        'Project Managment',
        true,
        'Alterum verterem eum cu, has commodo persius id. Ubique possit mediocritatem no sea. Paulo mediocrem ex qui. Mea an offendit deserunt interesset. Facilis delicata ad quo, id vis vocibus sapientem. Vim menandri scripserit no, postulant intellegam te eum.'
      ),
      Feature.new(
        'Customer Relationship Managment',
        false,
        'Et paulo equidem phaedrum sit. Saepe ignota fabulas ex eam, omnium dissentias cu ius. Eos ut graecis assentior similique, et regione accusamus nec. Id nulla menandri antiopam per.'
      ),
      Feature.new(
        'Procurement Managment',
        false,
        'Mediocrem persecuti temporibus ad mel. Usu sint lorem ea. Eum summo doctus ceteros ne. Vel molestiae concludaturque an. Falli placerat intellegat nec ei, per id adolescens scripserit.'
      ),
      Feature.new(
        'Issue Tracking',
        true,
        'In debet assentior sit, harum perfecto adipiscing et cum. In mel persequeris contentiones, has everti invidunt ad, debet meliore deterruisset quo at. Ex nam mazim vulputate, id saepe option theophrastus has. Ut atqui zril omittam ius, at unum sonet mediocrem per, commodo habemus et vim. No quis volumus philosophia mel.'
      ),
      Feature.new(
        'Inventory Managment',
        true,
        'Te quo vivendo sensibus instructior, oratio labore vel ex. Mei vivendum reprimique no, pri ad fastidii propriae conclusionemque. Quo sale vocibus eu. Ea atqui minim denique sit. Congue eleifend mea ei.'
      )
    ]
  end
end
