<main class="content">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <?php
		renderTitle(
			'Relatório Mensal',
			'Acompanhe seu saldo de horas',
			'icofont-ui-calendar'
		);
	?>
	<div>
		<form class="mb-4" action="#" method="post">
			<div class="input-group">
				<?php if($user->is_admin): ?>
					<select name="user" class="form-control mr-2" placeholder="Selecione o usuário...">
						<option value="">Selecione o usuário</option>
						<?php
							foreach($users as $user) {
								$selected = $user->id === $selectedUserId ? 'selected' : '';
								echo "<option value='{$user->id}' {$selected}>{$user->name}</option>";
							}
						?>
					</select>
				<?php endif ?>
				<select name="period" class="form-control" placeholder="Selecione o período...">
					<?php
						foreach($periods as $key => $month) {
							$selected = $key === $selectedPeriod ? 'selected' : '';
							echo "<option value='{$key}' {$selected}>{$month}</option>";
						}
					?>
				</select>
				<button class="btn btn-primary ml-2">
					<i class="icofont-search"></i>
				</button>
			</div>
		</form>

		<table class="table table-bordered table-striped table-hover">
			<thead>
				<th>Dia</th>
				<th>Entrada</th>
				<th>Intervalo</th>
				<th>Retorno</th>
				<th>Saída</th>
				<th>Saldo</th>
			</thead>
            <tbody>
            <?php foreach($report as $registry): ?>
                <?php
                // Obter o dia da semana (0 - domingo, 6 - sábado)
                $dayOfWeek = date('w', strtotime($registry->work_date));

                // Verificar se o dia da semana não é sábado (6) nem domingo (0)
                if ($dayOfWeek !== '0' && $dayOfWeek !== '6'):
                    ?>
                    <tr>
                        <td><?= formatDateWithLocale($registry->work_date, '%A, %d de %B de %Y') ?></td>
                        <td><?= $registry->time1 ?></td>
                        <td><?= $registry->time2 ?></td>
                        <td><?= $registry->time3 ?></td>
                        <td><?= $registry->time4 ?></td>
                        <td><?= $registry->getBalance() ?></td>
                    </tr>
                <?php endif; ?>
            <?php endforeach ?>
            <tr class="bg-primary text-white">
                <td>Horas Trabalhadas</td>
                <td colspan="3"><?= $sumOfWorkedTime ?></td>
                <td>Saldo Mensal</td>
                <td><?= $balance ?></td>
            </tr>
            </tbody>

        </table>
	</div>
</main>